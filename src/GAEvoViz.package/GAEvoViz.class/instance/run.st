running
run
	| canvas dictColor highlightBox highlightInnerBox dictCenterPanel boxIds ys barGroup centerPanel memo |
	dictColor := self dictionaryColors.
	canvas := RSCanvas new
		color: (dictColor at: 'background').
	highlightBox := RSHighlightable new
		highlightColor: (dictColor at: 'highlightBox');
		yourself.
	highlightInnerBox := RSHighlightable new
		highlightColor: (dictColor at: 'highlightInnerBox');
		yourself.
	memo := self convertDataPopulationOnMemo.
	dictCenterPanel := self centerPanelOn: canvas ofColor: dictColor highlight: (Array with: highlightBox with: highlightInnerBox) and: memo.
	boxIds := dictCenterPanel at: 'boxIds'.
	ys := dictCenterPanel at: 'ys'.
	barGroup := dictCenterPanel at: 'barGroup'.
	centerPanel := dictCenterPanel at: 'centerPanel'.
	"height := centerPanel height.
	generationContribution := self generationContributionGiven: height and: (ys collect: #key)."
	"similarityPanel := self similarityShape: canvas withHeight: height boxIds: boxIds and: (ys collect: [:ass | ass key + (ass value / 2)])."
	canvas addAll: centerPanel.
	self addHighlightBox: highlightBox on: canvas ofColor: (dictColor at: 'highlightBox').
	canvas @ RSCanvasController.
	^ canvas
	
	