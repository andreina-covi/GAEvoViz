as yet unclassified
similarityShape: boxIds ofHeight: height color: dictColor given: ys memo: memo
	| scale groupSimilarity lines x |
	scale := NSScale linear 
		domain: (Array with: 0 with: ys size);
		range: (Array with: 0 with: height).
	groupSimilarity := self similarityGroup: boxIds ofColor: dictColor size: (scale scale: 0.9) given: memo.
	lines := (groupSimilarity collect: #second) asGroup.
	groupSimilarity := (groupSimilarity collect: #first) asGroup.
	x := groupSimilarity first width / 2.0.
	groupSimilarity with: (ys collect: [:y | x @ y ]) do: [ :shape :position | 
		shape translateTo: position 	
	].
	^ Array 
		with: (RSComposite new shapes: groupSimilarity; yourself)
		with: lines