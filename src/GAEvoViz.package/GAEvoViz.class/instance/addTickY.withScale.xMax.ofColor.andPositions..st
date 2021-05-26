adding
addTickY: composite withScale: xScale xMax: xMax ofColor: color andPositions: ys
	ys doWithIndex: [ :y :index | 
		| tick lbl |
		tick := RSLine new 
			startPoint: (xScale scale: 0)@y;
			color: color;
			width: 10;
			endPoint: (xScale scale: (xMax * -0.003))@y;
			yourself.
		composite addShape: tick.
		lbl := RSLabel new 	
			fontSize: 30;
			color: color;
			text: index.
		RSLocation new outer left move: lbl on: tick.
		composite addShape: lbl.
	]