adding
addLegendOn: canvas given: color and: dictionary
	| y x presentSimilarity presentMetrics |
	y := x := 0.
	presentSimilarity := presentMetrics := false.
	dictionary at: 'similarity' ifPresent: [ :assocs | 
		x := 300.
		self addLegend: assocs on: canvas given: 'similarity' color: color and: [ :legend | legend location below left offset: x@100 ].
		y := -100.
		presentSimilarity := true ].
	dictionary at: 'metrics' 
		ifPresent: [ :assocs |
			self addLegend: assocs on: canvas given: 'metrics' color: color and: [ :legend | legend location below left offset: (x + 400)@(y + 50) ].
			y := -100.
			presentMetrics := true ].
	self addParticularLegend: (dictionary at: 'box') on: canvas given: 'range' color: color and: [ :legend |
		(presentSimilarity or: [ presentMetrics ]) 
			ifTrue: [ x := 200.
				legend location below center offset: -250@(y - 50) ]
			ifFalse: [ x := -100.
				legend location below left offset: 400@y ] ].
	self addParticularLegend: (dictionary at: 'innerBox') on: canvas given: 'innerBox' color: color and: [ :legend | legend location below center offset: (x)@150 negated ].
	self addLegend: (dictionary at: 'fitness') on: canvas given: 'fitness' color: color and: [ :legend | legend location below right offset: -700@150 negated ]