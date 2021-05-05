accessing
children: collection
	self assert: (collection notNil and: [ collection isCollection ]).
	self assert: (collection allSatisfy: [:obj | obj class == self class ]).
	children := collection