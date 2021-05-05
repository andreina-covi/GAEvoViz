accessing
at: generation of: position putIndividual: individual
	| dict |
	dict := self createOrGetDictionary: generation given: position.
	dict at: 'individual' put: individual