accessing
at: generation of: position
	^ memo at: generation 	
		ifPresent: [ :dict | dict at: position ifAbsent: [ nil ] ]
		ifAbsent: [ nil ]