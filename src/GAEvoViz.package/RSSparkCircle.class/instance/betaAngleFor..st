accessing - computed
betaAngleFor: aShape
	^ ( aShape index - (self defaultSliceShape border width / 360)) * 360 / totalSum.