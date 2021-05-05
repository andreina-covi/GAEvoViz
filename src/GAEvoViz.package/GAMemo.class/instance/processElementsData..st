as yet unclassified
processElementsData: collection
	collection do: [ :array | | dict |
		self assert: array size == 4.
		dict := self at: array first of: array second.
		self assert: (dict notNil and: [ dict notEmpty ]).
		dict at: 'elements' ifAbsentPut: [ Dictionary new ].
		(dict at: 'elements') at: array third put: array fourth 	 	
	]