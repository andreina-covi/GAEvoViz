sorting
sortFitnessValues: fitnessValues
	^ fitnessValues sort: [ :f1 :f2 | f1 perform: comparisonSelector with: f2 ]