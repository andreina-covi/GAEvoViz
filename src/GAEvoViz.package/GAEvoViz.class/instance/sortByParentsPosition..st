sorting
sortByParentsPosition: objects
	objects sort: [ :obj1 :obj2 | | positions |
		positions := obj1 parents collect: #position.
		(obj2 parents collect: #position) 
			detect: [ :p2 | positions anySatisfy: [ :p1 | p1 < p2 ] ]
			ifFound: [ true ]
			ifNone: [ false ]
		 ]