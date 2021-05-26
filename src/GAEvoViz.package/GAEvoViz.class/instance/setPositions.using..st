initialization
setPositions: barGroup using: ys
	ys doWithIndex: [ :y :index | 
		(barGroup at: index) translateTo: 0@y ].
	^ barGroup