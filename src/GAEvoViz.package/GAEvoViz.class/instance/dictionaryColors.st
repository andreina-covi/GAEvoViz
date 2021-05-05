accessing
dictionaryColors 
	dictionaryColors ifNil: [ 
		dictionaryColors := self defaultDictionaryColors.	
	].
	^ dictionaryColors