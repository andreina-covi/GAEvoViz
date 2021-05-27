accessing
metricFileName: string
	self assert: (string isString and: [ string notEmpty ]).
	metricFileName := string