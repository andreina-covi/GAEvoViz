accessing
processPopulationData: data with: populations 	
	| header content |
	header := data first.
	content := data second.
	self assert: header size > 3.
	self fillMemo: (header copyFrom: 4 to: header size) with: content.
	populations do: [ :pop |
		pop do: [ :ind | self addIndividual: ind ]
	] 
	