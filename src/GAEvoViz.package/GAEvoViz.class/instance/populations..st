accessing
populations: collections
	self assert: [ collections isCollection and: collections notEmpty ].
	self assert: (collections allSatisfy: #isCollection).
	populations := collections 