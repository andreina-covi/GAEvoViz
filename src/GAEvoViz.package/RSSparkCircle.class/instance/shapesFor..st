initialization
shapesFor: anObject
	| k |
	k := 0.
	^ values collect: [ :m |
		k := k + 1. 
		self shapeFor: m yourself index: k.
		 ] as: RSGroup.