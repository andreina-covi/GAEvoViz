accessing
fitnessValuesOf: generation
	^ (self at: generation) values 
		collect: [ :d | d at: 'fitness' ]