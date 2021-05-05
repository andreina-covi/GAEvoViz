as yet unclassified
processElementsData: collection
	collection do: [ :subCol | | dict |
		self assert: subCol size == 4.
		dict := self at: subCol first asInteger of: subCol second asInteger.
		self assert: (dict notNil and: [ dict notEmpty ]).
		dict at: 'elements' ifAbsentPut: [ Dictionary new ].
		(dict at: 'elements') at: subCol third put: subCol fourth asNumber 	 	
	]