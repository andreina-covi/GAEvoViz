accessing
evolutionOfPoints: yPositions withScale: scale given: memo
	| endPoint points listWorst listAverage listFittest |
	points := Dictionary new.
	endPoint := 0 @ 0.
	listWorst := OrderedCollection new add: endPoint; yourself.
	listAverage := OrderedCollection new add: endPoint; yourself.
	listFittest := OrderedCollection new add: endPoint; yourself.
	points 
		at: 'fittest' put: listFittest;
		at: 'average' put: listAverage;
		at: 'worst' put: listWorst.
	1 to: memo size do: [ :index | | sortedValues y |
		sortedValues := (self sortFitnessValues: (memo fitnessValuesOf: index)).
		y := yPositions at: index.
		listWorst add: (scale scale: sortedValues last) @ y.
		listAverage add: (scale scale: (sortedValues at: (sortedValues size / 2) asInteger)) @ y.
		listFittest add: (scale scale: sortedValues first) @ y 
	].
	^ points