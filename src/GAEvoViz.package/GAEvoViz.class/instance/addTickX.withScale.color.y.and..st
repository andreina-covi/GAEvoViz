adding
addTickX: composite withScale: scale color: color y: y and: posMax
	| stepX |
	stepX := posMax x / 5.
	stepX to: posMax x by: stepX do: [ :i |
		| aTick lbl |
		aTick := RSLine new 
			startPoint: (scale scale: i)@(y - (0.01 * posMax y));
			color: color;
			width: 10;
			endPoint: (scale scale: i)@(y - ((0.01 * posMax y) - 35));
			yourself.
		composite addShape: aTick.
		lbl := RSLabel new 
		fontSize: scale range second * 0.04;
		color: color;
		text: (i round: 1) asFloat asString, '%'.
		RSLocation new below move: lbl on: aTick.
		composite addShape: lbl.
	].