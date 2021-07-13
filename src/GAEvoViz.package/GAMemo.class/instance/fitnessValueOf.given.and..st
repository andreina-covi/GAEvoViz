accessing
fitnessValueOf: generation given: position and: elementId
	| dict |
	dict := self at: generation of: position.
	dict ifNil: [ Error signal: 'Not found data' ].
	^ (dict at: 'elements') at: elementId ifAbsent: [ Error new signal: 'Error not found' ]