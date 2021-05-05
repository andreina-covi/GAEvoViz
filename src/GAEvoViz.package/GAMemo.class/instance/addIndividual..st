adding
addIndividual: individual
	self assert: individual notNil.
	self at: individual generation of: individual position putIndividual: individual