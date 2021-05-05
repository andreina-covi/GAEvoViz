as yet unclassified
fillMemo: metricNames with: collection
	collection do: [ :array |
		self at: array first asInteger of: array second asInteger put: array third asNumber.
		self at: array first asInteger of: array second asInteger putMetrics: (metricNames with: (array copyFrom: 4 to: array size) collect: [:mName :val | mName -> (val asNumber) ])	
	]