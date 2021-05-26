initialization
scaleTo: aNumber
	scale := aNumber.
	sliceShape 
		innerRadius: scale/ 10;
		externalRadius: scale * 1.2