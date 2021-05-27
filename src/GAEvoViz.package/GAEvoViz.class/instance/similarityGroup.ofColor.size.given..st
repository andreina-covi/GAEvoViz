accessing
similarityGroup: boxIds ofColor: dictColor size: size given: memo
	| data |
	data := self transformToDictionary: (self readContent: self similarityFile).
	^ (1 to: memo size) collect: [ :index | 
		self similarityPopulationShape: memo ofColor: dictColor size: size given: index ids: boxIds and: (data at: index)
	]