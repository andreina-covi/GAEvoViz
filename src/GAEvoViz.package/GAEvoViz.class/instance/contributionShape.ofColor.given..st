as yet unclassified
contributionShape: height ofColor: dictColor given: ys
	| data header colors infoColor scale groupSpark x composite |
	data := self readHeaderAndContentFrom: self metricsFile.
	header := data first.
	colors := dictColor at: 'rangeColors'.
	infoColor := (header collectWithIndex: [ :string :index | | indexColor |
		indexColor := index \\ colors size.
		index -> (string -> (colors at: (indexColor == 0 ifTrue: [colors size] ifFalse: [indexColor ]) ))	
	]) asDictionary.
	scale := NSScale linear 
		domain: (Array with: 0 with: ys size);
		range: (Array with: 0 with: height).
	groupSpark := self sparkCircleGroup: data second ofColor: infoColor size: (scale scale: 1).
	x := (groupSpark maxValue: #width) / 2.0.
	groupSpark with: (ys collect: [:y | x @ y]) do: [ :shape :position | 
		shape translateTo: position + (shape nodes first extent / 2 * (0 @ 1))	
	].
	composite := RSComposite new
		shapes: groupSpark;
		yourself.
	^ Array with: composite with: infoColor