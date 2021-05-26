initialization
slices: aBlockOrASymbol
	values := objects collect: [:m | aBlockOrASymbol value: m value ] as: Array.
	"blocksOrSymbols collect: [:blOrSymbol | 
		blOrSymbol value: objects ] as: Array."
	sumValues := Array new: objects size.
	"tempSum := 0.
	values doWithIndex: [ :v :i |
		sumValues at: i put: tempSum.
		tempSum := tempSum + v
		 ].
	totalSum := tempSum."
	1 to: values size do: [ :index | sumValues at: index put: index - 1 ]. 
	totalSum := values size