accessing
at: generation of: position getElementFitnessValue: idElement
	| dictionary |
	dictionary := self createOrGetDictionary: generation given: position.
	^ dictionary at: 'elements' 
		ifPresent: [ :dict | dict at: idElement ifAbsent: [ nil ] ]
		ifAbsent: [ nil ]