accessing
fitnessValueOf: generation given: position
	| dict |
	dict := self at: generation of: position.
	dict ifNil: [ Error signal: 'Not found data' ].
	^ dict at: 'fitness' ifAbsent: [ Error signal: 'Error not found' ]