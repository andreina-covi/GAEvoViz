accessing
sparkCircleGroup: collection ofColor: dictColor size: size
	^ collection collect: [ :array | | spark group |
		group := RSGroup new.
		spark := RSSparkCircle new
			objects: array;
			container: group;
			slices: [:model | model asNumber round: 2 ];
			sliceColor: [ :shape | (dictColor at: shape index) value ].
		spark scaleTo: size.
		spark 	build.
		RSComposite new
			shapes: group;
			yourself
	] as: RSGroup 