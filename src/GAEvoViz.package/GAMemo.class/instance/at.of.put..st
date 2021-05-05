accessing
at: generation of: position put: number
	| dict |
	dict := self createOrGetDictionary: generation given: position.
	dict at: 'fitness' put: number