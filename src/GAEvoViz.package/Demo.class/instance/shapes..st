accessing
shapes: canvas
	| group |
	group := RSGroup new
		add: (RSBox new color: Color blue; size: 20@20);
		add: (RSEllipse new color: Color red; size: 20@20);
		yourself.
	RSGridLayout on: group.
	^ group