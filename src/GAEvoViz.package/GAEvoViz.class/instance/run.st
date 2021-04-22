running
run
	| canvas dictColor highlightBox |
	dictColor := self dictionaryColors.
	canvas := RSCanvas new
		color: (dictColor at: 'background').
	highlightBox := RSHighlightable new
		highlightColor: (dictColor at: 'highlightBox');
		yourself.
	highlightBox := RSHighlightable new
		highlightColor: (dictColor at: 'highlightInnerBox');
		yourself.
	