testing
isElement: element fitnessValue: number of: object higher: memo
	| previousValues |
	object parents ifEmpty: [ ^ true ].
	previousValues := object parents 
		collect: [ :obj | memo at: obj generation of: obj position getElementFitnessValue: element id ]
		thenSelect: [ :elm | elm notNil ].
	^ previousValues 
		ifNotEmpty: [ previousValues max < number  ] 
		ifEmpty: [ object parents allSatisfy: [ :obj |
			self isElement: element fitnessValue: number of: object higher: memo
				 ] ]
	
	