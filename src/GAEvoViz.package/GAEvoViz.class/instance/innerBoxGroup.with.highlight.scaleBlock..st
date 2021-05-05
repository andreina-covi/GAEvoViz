as yet unclassified
innerBoxGroup: object with: memo highlight: highlight scaleBlock: block
	| group |
	group := RSGroup new.
	group addAll: (object elements 
		select: [:element | self isElement: element fitnessValue: (memo at: object generation of: object position getElementFitnessValue: element id) of: object higher: memo ]
		thenCollect: [:element |
			| scaleColor shape |
			"each element must have an id to differentiate with each other"
			scaleColor := block value: element id.
			"an element should return the shape that represents it in the visualization"
			shape := element shape: object.
			(self innerBox: element withGradientFrom: (scaleColor scale: (memo fitnessValueOf: object generation given: object position and: element id)) to: (scaleColor scale: 100) andShape: shape) @ highlight; yourself
			]).
	RSGridLayout on: group.
	^ group