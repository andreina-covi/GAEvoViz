as yet unclassified
innerBoxColorDictionary: rangeColor given: strings
	| colors scale color index |
	colors := OrderedCollection new.
	scale := NSScale linear range: (Array with: 1 with: rangeColor size).
	color := NSScale linear range: rangeColor; 
		domain: ((1 to: rangeColor size) collect: [:n | scale scale: n]).
	index := 0.
	colors addAll: (strings collect: [:name |
		index := index + 1.
		name -> (color scale: index)	
	]).
	^ colors asDictionary 