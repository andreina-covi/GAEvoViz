accessing - computed
alphaAngleFor: aShape
	values ifNil: [ self slices: #yourself ].
	^ ((sumValues at: aShape index) + (self defaultSliceShape border width/360)) * 360 / totalSum