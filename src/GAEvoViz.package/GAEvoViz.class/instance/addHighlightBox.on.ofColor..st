adding
addHighlightBox: highlight on: canvas ofColor: color
	| interaction  |
	interaction :=  RSHighlightableInteraction new highlightColor: color; yourself.
	highlight 
		when: RSHighlightEvent do: [ :evt | 
			| shapes edges index |
			index := canvas shapes indexOf: evt shape.
			shapes := evt shape model allParents.
			shapes := (canvas shapes first: index) select: [ :shape | shapes includes: shape model ].
			edges := ((Array with: evt shape),  shapes) flatCollect: [ :object | object incomingEdges collect: #yourself as: RSGroup ].
			interaction doHighlightShapes: shapes, edges.
			canvas propertyAt: #objects put: shapes.
			canvas propertyAt: #edges put: edges ];
		when: RSUnHighlightEvent do: [ :evt | 
			(canvas propertyAt: #objects ifAbsent: [ #() ]) do: [:shape | 
				interaction restore: shape selector: #color
				].
			(canvas propertyAt: #edges ifAbsent: [ #() ]) do: [ :edge | 
				interaction restore: edge selector: #color
				 ] ]