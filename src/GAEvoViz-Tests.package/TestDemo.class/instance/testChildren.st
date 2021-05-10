tests
testChildren
	| d1 d2 |
	d1 := Demo new 
		generation: 1;
		position: 1.
	self should: [d1 children: #(1)] raise: AssertionFailure.
	self assert: d1 children isEmpty.
	d2 := Demo new
		generation: 2;
		position: 1.
	self shouldnt: [ d1 children: (Array with: d2)] raise: AssertionFailure.
	self assert: d1 children size equals: 1.
	