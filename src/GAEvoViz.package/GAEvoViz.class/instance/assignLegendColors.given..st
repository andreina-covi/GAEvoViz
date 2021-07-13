running
assignLegendColors: dictionary given: dictColor
	| colors |
	colors := dictColor at: 'rangeColors'.
	dictionary 
		at: 'box' put: (Array 
			with: 'Individual' -> (dictColor at: 'backgroundBox')
			with: 'Remarkable individual' -> (Array with: (dictColor at: 'backgroundBox') with: (dictColor at: 'borderBox'))
			with: 'Elements' -> (Array 
				with: 0 -> colors first
				with: 1 -> colors last ));
		at: 'innerBox' put: (Array 
			with: 'Elements' -> (Array 
				with: 0 -> colors first
				with: 1 -> colors last ));
		at: 'fitness' put: (Array 
			with: 'Worst fitness' -> (dictColor at: 'worstFitness')
			with: 'Average fitness' -> (dictColor at: 'averageFitness')
			with: 'Fittest fitness' -> (dictColor at: 'fittestFitness') ).
	similarityFilename ifNotNil: [ 
		dictionary at: 'similarity' put: (Array with: 'Similar' -> (dictColor at: 'edgeSimilarity')) ]