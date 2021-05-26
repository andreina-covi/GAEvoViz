initialization
shapeFor: anObject index: index
	| slice externalRadius width |
	slice := self defaultSliceShape copy.
	"value := values at: index."
	externalRadius := (Array with: 1 with: (anObject * 10 ) "(value < 1 ifTrue: [ value * 100 ] ifFalse: [ value ])") max.
	width := (values min * slice innerRadius) max: 0.2.
	slice
		model: anObject * 100;
		index: index;
		color: (self sliceColor rsValue: slice);
		alphaAngle: (self alphaAngleFor: slice);
		betaAngle: (self betaAngleFor: slice);
		externalRadius: slice innerRadius + (slice externalRadius/10 * (externalRadius log)) + 1.
	slice border: (RSBorder new width: width;
		color: (width == 0.2 ifTrue: [ Color black] ifFalse: [ slice color muchDarker]));
		popupText: (anObject * 100 round: 2) printString, '%'.
	^ slice