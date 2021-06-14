running
run
	| canvas dictColor highlightBox highlightInnerBox dictCenterPanel boxIds ys barGroup centerPanel memo evolutionShape contributionShape similarityShape lines dictionaryLegendColor |
	dictColor := self dictionaryColors.
	dictionaryLegendColor := Dictionary new.
	canvas := RSCanvas new
		color: (dictColor at: 'background').
	highlightBox := RSHighlightableInteraction new
		highlightColor: (dictColor at: 'highlightBox');
		yourself.
	highlightInnerBox := RSHighlightableInteraction new
		highlightColor: (dictColor at: 'highlightInnerBox');
		yourself.
	memo := self convertDataPopulationOnMemo.
	dictCenterPanel := self centerPanelOn: canvas ofColor: dictColor highlight: (Array with: highlightBox with: highlightInnerBox) and: memo.
	boxIds := dictCenterPanel at: 'boxIds'.
	ys := dictCenterPanel at: 'ys'.
	barGroup := dictCenterPanel at: 'barGroup'.
	centerPanel := dictCenterPanel at: 'centerPanel'.
	metricFileName ifNotNil: [ 
		contributionShape := self contributionShape: centerPanel height ofColor: dictColor given: (ys collect: #key).
		dictionaryLegendColor at: 'metrics' put: (contributionShape second associations collect: #value).
		contributionShape := contributionShape first ].
	similarityFilename ifNotNil: [ 
		similarityShape := self similarityShape: boxIds ofHeight: centerPanel height color: dictColor given: (ys collect: [:ass | ass key + (ass value / 2)]) memo: memo.
		lines := (similarityShape second flatCollect: #yourself) asGroup.
		similarityShape := similarityShape first.
		similarityShape translateTo: (centerPanel encompassingRectangle topLeft x - (similarityShape encompassingRectangle width) - (contributionShape ifNil: [ 0 ] ifNotNil: [contributionShape encompassingRectangle width])) @ similarityShape position y.
		canvas addShape: similarityShape.
		canvas addAll: lines.
		lines pushBack ].
	contributionShape ifNotNil: [ 
		contributionShape translateTo: (centerPanel encompassingRectangle topLeft x - contributionShape width - 50) @ centerPanel position y.
		canvas addShape: contributionShape ]. 
	canvas addAll: centerPanel.
	(canvas edges select: [:edge | edge class == RSLine ]) pushBack.
	barGroup translateTo: (centerPanel encompassingRectangle topRight x + (barGroup width * 1.2)) @ centerPanel position y.
	canvas addShape: barGroup.
	evolutionShape := self evolutionShape: (ys collect: #key) ofColor: dictColor size: 800@(centerPanel height) negated given: memo.
	evolutionShape translateTo: (barGroup encompassingRectangle topRight x + 550) @ ((contributionShape ifNil: [ centerPanel position y ] ifNotNil: [ contributionShape position y ]) + 25).
	canvas addShape: evolutionShape.
	self addHighlightBox: highlightBox on: canvas ofColor: (dictColor at: 'highlightBox').
	self assignLegendColors: dictionaryLegendColor given: dictColor.
	self addLegendOn: canvas given: (dictColor at: 'font') and: dictionaryLegendColor.
	canvas @ RSCanvasControllerInteraction.
	^ canvas
	
	