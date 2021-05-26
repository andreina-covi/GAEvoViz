initialization
initialize
	super initialize.
	scale := 100.
	self sliceColor: [ :slice | 
		slice index even 
			ifTrue: [ Color lightGray ]
			ifFalse: [ Color gray ] ].
	sliceShape := RSPieSlice new
		segmentSpacing: 0.13;
		border: (RSBorder new width: 5; color: Color gray; yourself);
		innerRadius: 10;
		externalRadius: 120