accessing
similarityPopulationShape: memo ofColor: dictColor size: size given: generation ids: boxIds and: data
	| similarityShape lines |
	similarityShape := self similarityPopulationGroup: (memo populationAt: generation) given: boxIds color: dictColor and: size.
	lines := similarityShape shapes flatCollect: [ :from | 
		similarityShape shapes 
			select: [ :to | from model position == to model position 
				ifTrue: [ false ]
				ifFalse: [ data at: (from model position) 
					ifPresent: [ :list | list includes: to model position ]
					ifAbsent: [ false ] ] ] 
			thenCollect: [ :to | 
				RSLine new 
					model: from model -> to model;
					from: from;
					color: (dictColor at: 'edgeSimilarity');
					to: to;
					width: 5;
					yourself	
			]	
	].
	^ Array with: similarityShape with: lines asGroup