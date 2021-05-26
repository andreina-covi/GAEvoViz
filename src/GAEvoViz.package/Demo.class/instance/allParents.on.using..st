as yet unclassified
allParents: node on: collection using: set
	node parents 
		reject: [ :obj | (set includes: obj generation -> obj position) ]
		thenDo: [ :obj | 
			set add: obj generation -> obj position.
			collection add: obj.
			self allParents: obj on: collection using: set ]