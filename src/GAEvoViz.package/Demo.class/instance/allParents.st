accessing
allParents 
	| col |
	col := OrderedCollection new.
	self allParents: self on: col using: Set new.
	^ col