as yet unclassified
box: object ofColor: dictColor with: memo highlight: highlight scaleBlock: block
	| group innerBoxGroup fitnessValue isRemarkable enhance |
	group := RSGroup new.
	innerBoxGroup := self innerBoxGroup: object with: memo highlight: highlight scaleBlock: block.
	fitnessValue := (memo fitnessValueOf: object generation given: object position) round: 2.
	isRemarkable := object parents ifEmpty: [ false ] 
		ifNotEmpty: [ object parents allSatisfy: [ :obj | (memo fitnessValueOf: obj generation given: obj position) perform: comparisonSelector with: fitnessValue ] ]. 
	enhance := innerBoxGroup notEmpty or: [ isRemarkable ].
	group add: innerBoxGroup;
		add: (RSGroup new
			add: (RSComposite new 
				addShape: (RSLabel new text: fitnessValue asString, '%'; bold;
				color: ((dictColor at: 'fontBox') alpha: (enhance ifFalse: [0.5] ifTrue: [1])); fontSize: 20 );
				padding: (Margin left: 10 right: 10 top: 1 bottom: 1)); yourself ).
	RSVerticalLineLayout on: group.
	^ RSComposite new
		shapes: (group flatCollect: #yourself);
		paint: ((dictColor at: 'backgroundBox') alpha: (enhance ifFalse: [ 0.5 ] ifTrue: [1]));
		model: object;
		border: (RSBorder new width: (isRemarkable ifTrue: [ 8 ] ifFalse: [ 1 ] );
			color: (dictColor at: 'borderBox'));
		padding: 10;
		popupText: object print;
		draggable