as yet unclassified
evolutionShape: yPositions ofColor: dictColor size: size given: memo
	| composite scale points spaceStick xMax |
	composite := RSComposite new 
		color: Color transparent.
	xMax := self getMaximumFitnessValue: memo.
	scale := NSScale linear 
		domain: (Array with: 0 with: xMax);
		range: (Array with: 0 with: size x).
	points := self evolutionOfPoints: yPositions, #(0) withScale: scale given: memo.
	spaceStick := yPositions last - (0.01 * size y).
	composite 
		addShape: (RSPolyline new 
			color: (dictColor at: 'axis');
			width: 10;
			controlPoints: ((Array with: 0@0 with: 0@spaceStick with: (scale scale: xMax)@spaceStick));
			yourself);
		addShape: (RSPolyline new 
			controlPoints: (points at: 'worst');
			color: (dictColor at: 'worstFitness');
			width: 10; yourself);
		addShape: (RSPolyline new 
			controlPoints: (points at: 'average');
			color: (dictColor at: 'averageFitness');
			width: 10; yourself);
		addShape: (RSPolyline new 
			controlPoints: (points at: 'fittest');
			color: (dictColor at: 'fittestFitness');
			width: 10; yourself).
	self addTickX: composite withScale: scale color: (dictColor at: 'font') y: yPositions last and: xMax @ size y.
	self addTickY: composite withScale: scale xMax: 100 ofColor: (dictColor at: 'font') andPositions: yPositions.
	^ composite adjustToChildren 