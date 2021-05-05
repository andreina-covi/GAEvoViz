accessing
createOrGetDictionary: generation given: position
	| res |
	memo at: generation 
		ifPresent: [ :dict | dict at: position 
			ifAbsentPut: [ Dictionary new ].
			res := dict at: position ]
		ifAbsentPut: [ res := Dictionary new.
			Dictionary new at: position put: res; yourself
	].
	^ res
	