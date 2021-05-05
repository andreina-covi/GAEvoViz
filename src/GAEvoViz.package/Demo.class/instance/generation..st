accessing
generation: number
	self assert: (number isInteger and: [ number positive ]).
	generation := number