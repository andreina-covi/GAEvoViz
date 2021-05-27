accessing
innerBoxColorDictionary: rangeColor given: strings
	| colors scale color |
	colors := OrderedCollection new.
	scale := NSScale linear 
		range: (Array with: 1 with: strings size); 
		domain: (Array with: 1 with: rangeColor size).
	color := NSScale linear range: rangeColor; 
		domain: ((1 to: rangeColor size) collect: [:n | scale scale: n]).
	colors addAll: (strings asOrderedCollection collectWithIndex: [:name :index |
		name -> (color scale: index)	
	]).
	^ colors asDictionary 