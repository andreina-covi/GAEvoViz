accessing
populationAt: generation
	| dict |
	dict := self at: generation.
	dict ifNil: [ Error signal: 'Not found data' ].
	^ dict values collect: [ :d | d at: 'individual' ]