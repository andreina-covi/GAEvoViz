accessing
getMaximumFitnessValue: memo
	^ ((1 to: memo size) collect: [ :index | 
		 (memo fitnessValuesOf: index) max ]) max