testing
isElement: element fitnessValue: number of: object remarkable: memo
	| previousValues sel minMax |
	object parents ifEmpty: [ ^ true ].
	sel := comparisonSelector == #> 
		ifTrue: [ minMax := #max.
			 #< ] 
		ifFalse: [ minMax := #min.
			#> ].
	previousValues := object parents 
		collect: [ :obj | memo at: obj generation of: obj position getElementFitnessValue: element id ]
		thenSelect: [ :elm | elm notNil ].
	^ previousValues 
		ifNotEmpty: [ (previousValues perform: minMax) perform: sel with: number  ] 
		ifEmpty: [ object parents allSatisfy: [ :obj |
			self isElement: element fitnessValue: number of: obj remarkable: memo
		] ]
	
	