accessing
dictionaryColors: dictionary
	self assert: (dictionary isDictionary and: [ dictionary notEmpty ]).
	dictionaryColors := dictionary 