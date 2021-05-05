baselines
baseline: spec
	<baseline>
	spec 
		for: #common
		do: [ 
			spec baseline: 'NeoCSV'
				with: [ spec repository: 'github://svenvc/NeoCSV/repository' ].
			spec baseline: 'Roassal3'
				with: [ spec repository: 'github://ObjectProfile/Roassal3' ].
			spec package: 'GAEvoViz' ]