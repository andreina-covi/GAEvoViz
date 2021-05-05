as yet unclassified
centerPanelOn: canvas ofColor: dictColor highlight: highlights
	| generationGroup barGroup survivors boxIds set ys memo scaleColorBlock shapes printInnerBoxes |
	generationGroup := RSGroup new.
	barGroup := RSGroup new.
	survivors := OrderedCollection new.
	boxIds := Dictionary new.
	set := Set new.
	ys := OrderedCollection new.
	populations first do: [ :obj | self addSurvivor: obj on: survivors using: set and: generations ].
	survivors sort: [ :obj1 :obj2 | (obj1 generation < obj2 generation) or: [ (obj1 generation = obj2 generation) and: [ obj1 children size < obj2 children size ] ] ].
	memo := GAMemo new.
	printInnerBoxes := (survivors flatCollect: [ :obj | obj elements collect: #asString ]) asSet.
	scaleColorBlock := self scaleColorBlock: (self innerBoxColorDictionary:(dictColor at: 'rangeInnerBoxColor') given: printInnerBoxes).
	generationGroup addAll: (
		(survivors groupedBy: [:obj | obj generation]) collect: [ :objects |
			| group genNumber |
			group := RSGroup new.
			group addAll: (objects collect: [:obj | 
				boxIds at: obj generation 
					ifPresent: [ :col | col add: obj position ]
					ifAbsentPut: [ OrderedCollection new add: obj position; yourself ].
				(self box: obj 
					ofColor: dictColor 
					with: memo 
					highlight: highlights second
					scaleBlock: scaleColorBlock) @ highlights first; yourself
				]).
				RSHorizontalLineLayout new gapSize: 20; on: group.
				genNumber := objects first generation.
				barGroup add: (self discardedBarFrom: objects size to: (populations at: genNumber) size ofColor: dictColor).
				group
			]
	).
	RSVerticalLineLayout new gapSize: 300; on: generationGroup.
	shapes := generationGroup flatCollect: #yourself.
	ys := (shapes groupedBy: [:s | s encompassingRectangle origin y ]) associations 
		collect: [ :assoc | assoc key -> (assoc value collect: [:comp | comp extent y ]) max ].
	RSEdgeBuilder verticalBezier 
		shapes: shapes;
		canvas: canvas;
		width: 5;
		color: (dictColor at: 'edge');
		connectFromAll: [ :obj | obj parents ].
	^ Array with: shapes with: barGroup with: boxIds