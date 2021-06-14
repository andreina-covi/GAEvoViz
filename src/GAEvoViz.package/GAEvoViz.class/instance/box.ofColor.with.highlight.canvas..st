as yet unclassified
box: object ofColor: dictColor with: memo highlight: highlight canvas: canvas
	| group innerBoxGroup fitnessValue isRemarkable sel |
	group := RSGroup new.
	sel := comparisonSelector == #> ifTrue: [ #< ] ifFalse: [ #> ].
	"innerBoxGroup := self innerBoxGroup: object with: memo highlight: highlight scaleBlock: block."
	innerBoxGroup := blockInnerBox valueWithEnoughArguments: (Array with: (object shapes: canvas)).
	fitnessValue := memo fitnessValueOf: object generation given: object position.
	isRemarkable := object parents ifEmpty: [ false ] 
		ifNotEmpty: [ object parents allSatisfy: [ :obj | (memo fitnessValueOf: obj generation given: obj position) perform: sel with: fitnessValue ] ]. 
	"enhance := innerBoxGroup notEmpty or: [ isRemarkable ]."
	group add: innerBoxGroup;
		add: (RSGroup new
			add: (RSComposite new 
				addShape: (RSLabel new text: fitnessValue asString, '%'; bold;
				color: ((dictColor at: 'fontBox') alpha: (isRemarkable ifFalse: [0.5] ifTrue: [1])); fontSize: 20 );
				padding: (Margin left: 10 right: 10 top: 1 bottom: 1)); yourself ).
	RSVerticalLineLayout on: group.
	^ RSComposite new
		shapes: (group flatCollect: #yourself);
		paint: ((dictColor at: 'backgroundBox') alpha: (isRemarkable ifFalse: [ 0.5 ] ifTrue: [1]));
		model: object;
		border: (RSBorder new width: (isRemarkable ifTrue: [ 8 ] ifFalse: [ 1 ] );
			color: (dictColor at: 'borderBox'));
		padding: 10;
		popupText: object asString;
		draggable