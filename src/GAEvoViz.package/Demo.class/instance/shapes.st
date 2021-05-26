accessing
shapes 
	| group |
	group := RSGroup new
		add: (RSBox new color: Color blue; size: 20@20);
		add: (RSEllipse new color: Color red; size: 20@20);
		yourself.
	RSGridLayout on: group.
	^ group
	"^ [:memo :highlight | | group block |
		group := RSGroup new.
		group addAll: (elements 
			select: [:element | self isRemarkable: element given: memo ]
			thenCollect: [:element | | scaleColor shape |
				""each element must have an id to differentiate with each other""
				scaleColor := block value: element id.
				""an element should return the shape that represents it in the visualization""
				shape := element shape: self.
				(self innerBox: element withGradientFrom: (scaleColor scale: (memo fitnessValueOf: generation given: position and: element id)) to: (scaleColor scale: 100) andShape: shape) @ highlight; yourself
			]).
		RSGridLayout on: group.
		group ]"