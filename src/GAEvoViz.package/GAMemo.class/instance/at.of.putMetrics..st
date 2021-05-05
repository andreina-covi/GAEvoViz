accessing
at: generation of: position putMetrics: associations
	| dict |
	dict := self createOrGetDictionary: generation given: position.
	dict at: 'metrics' put: (Dictionary newFromAssociations: associations).
	