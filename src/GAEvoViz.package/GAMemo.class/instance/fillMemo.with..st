as yet unclassified
fillMemo: metricNames with: collection
	collection do: [ :array |
		self at: array first of: array second put: array third.
		self at: array first of: array second putMetrics: (metricNames with: (array copyFrom: 4 to: array size) collect: [:mName :val | mName -> val ])	
	]