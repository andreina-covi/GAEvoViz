as yet unclassified
innerBox: element withGradientFrom: color1 to: color2 andShape: shape
	| gradient group |
	gradient := LinearGradientPaint fromArray: (Array with: 0->color1 with: 1->color2).
	gradient start: -50@0; stop: 50@0.
	group := RSGroup new.
	RSVerticalLineLayout new on: group; gapSize: 0.
	^ shape size: 50;
		color: gradient;
		border: RSBorder new;
		model: element;
		popupText: #popup;
		yourself