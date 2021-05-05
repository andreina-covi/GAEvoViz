as yet unclassified
scaleColorBlock: dictionary
	^ [ :key | | color |
		color := [ dictionary at: key ] on: KeyNotFound do: [ Color black ].
		NSScale linear 
			range: (Array with: (color alphaMixed: 0.6 with: Color black) with: color);
			domain: #(0 100) ]