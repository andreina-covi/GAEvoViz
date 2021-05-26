as yet unclassified
similarityPopulationGroup: population given: boxIds color: dictColor and: size
	| group |
	group := RSGroup new.
	group addAll: (population collect: [:indiv | 
		RSComposite new 
			addShape: (RSEllipse new 
				size: (size/12)@(size/12);
				color: (((boxIds at: indiv generation ifAbsent: [#()]) includes: indiv position) ifTrue: [ dictColor at: 'markedSimilarityIndividual' ] ifFalse: [ dictColor at: 'similarityIndividual' ] ));
			addShape: (RSLabel new 
				text: indiv asString;
				color: (dictColor at: 'individualFontColor');
				fontSize: size/25;
				bold;
				position: 0@0);
			model: indiv;
			adjustToChildren;
			yourself 	
	]).
	RSCircleLayout new radius: size / 2; on: group.
	^ RSComposite new 
		shapes: (group collect: #yourself);
		model: population