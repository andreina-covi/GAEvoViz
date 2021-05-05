accessing
elements: collection
	self assert: (collection notNil and: [ collection isCollection ]).
	self assert: (collection allSatisfy: [:obj | obj class == ElementDemo ]).
	elements := collection