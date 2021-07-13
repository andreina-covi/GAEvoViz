visualization
centerPanelOn: canvas ofColor: dictColor highlight: highlights and: memo
	| generationGroup barGroup survivors boxIds set ys shapes fitnessValue |
	generationGroup := RSGroup new.
	barGroup := RSGroup new.
	survivors := OrderedCollection new.
	boxIds := Dictionary new.
	set := Set new.
	ys := OrderedCollection new.
	fitnessValue := (self sortFitnessValues: (memo fitnessValuesOf: memo size)) size.
	populations first do: [ :obj | self addSurvivor: obj on: survivors using: set generation: populations size fitness: fitnessValue and: memo ].
	survivors sort: [ :obj1 :obj2 | (obj1 generation < obj2 generation) or: [ (obj1 generation = obj2 generation) and: [ obj1 position < obj2 position ] ] ].
	"printInnerBoxes := (survivors flatCollect: [ :obj | obj elements collect: #asString ]) asSet.
	scaleColorBlock := self scaleColorBlock: (self innerBoxColorDictionary:(dictColor at: 'rangeColors') given: printInnerBoxes)."
	generationGroup addAll: (
		(survivors groupedBy: [:obj | obj generation]) values collectWithIndex: [ :objects :index |
			| group genNumber |
			group := RSGroup new.
			index > 1 ifTrue: [ self sortByParentsPosition: objects ].
			group addAll: (objects collect: [:obj |
				boxIds at: obj generation 
					ifPresent: [ :col | col add: obj position ]
					ifAbsentPut: [ OrderedCollection new add: obj position; yourself ].
				(self box: obj 
					ofColor: dictColor 
					with: memo 
					highlight: highlights second
					canvas: canvas) @ highlights first; yourself
				]).
				RSHorizontalLineLayout new gapSize: 20; on: group.
				genNumber := objects first generation.
				barGroup add: (self discardedBarFrom: objects size to: (populations at: genNumber) size ofColor: dictColor).
				group
			]
	).
	RSVerticalLineLayout new gapSize: 300; on: generationGroup.
	shapes := generationGroup flatCollect: #yourself.
	ys := generationGroup collect: [ :grp | 
		grp first encompassingRectangle origin y -> (grp collect: [:e | e extent y ]) max ].
	"ys := (shapes groupedBy: [:s | s encompassingRectangle origin y ]) associations 
		collect: [ :assoc | assoc key -> (assoc value collect: [:comp | comp extent y ]) max ]."
	barGroup := RSComposite new shapes: (self setPositions: barGroup using: (ys collect: #key)).
	RSEdgeBuilder verticalBezier 
		shapes: shapes;
		canvas: canvas;
		width: 5;
		color: (dictColor at: 'edge');
		withBorderAttachPoint;
		connectFromAll: [ :obj | obj parents ].
	^ Dictionary new 
		at: 'boxIds' put: boxIds;
		at: 'centerPanel' put: shapes;
		at: 'barGroup' put: barGroup;
		at: 'ys' put: ys;
		yourself