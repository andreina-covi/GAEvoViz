testing
isElement: element fitnessValue: number of: object remarkable: memo
	| previousValues |
	object parents ifEmpty: [ ^ true ].
	previousValues := object parents 
		collect: [ :obj | memo at: obj generation of: obj position getElementFitnessValue: element id ]
		thenSelect: [ :elm | elm notNil ].
	^ previousValues 
		ifNotEmpty: [ previousValues max perform: comparisonSelector with: number  ] 
		ifEmpty: [ object parents allSatisfy: [ :obj |
			self isElement: element fitnessValue: number of: obj remarkable: memo
		] ]
	
	