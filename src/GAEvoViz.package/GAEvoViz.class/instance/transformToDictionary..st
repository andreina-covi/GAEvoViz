accessing
transformToDictionary: collection
	| dictionary |
	self assert: collection notEmpty.
	dictionary := Dictionary new.
	collection do: [ :array | | d | 
		self assert: array size == 3.
		dictionary at: array first asInteger ifAbsentPut: [ Dictionary new ].
		d := dictionary at: array first asInteger.
		d at: array second asInteger ifAbsentPut: [ Set new ].
		(d at: array second asInteger) add: array third asInteger
	].
	^ dictionary
	
	