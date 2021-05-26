adding
addParticularLegend: associations on: canvas given: string color: color and: blockLocation
	| legend |
	legend := RSLegend new 
		container: canvas;
		defaultLabel: (RSLabel new color: color; yourself);
		yourself.
	associations doWithIndex: [ :assoc :index | | colorBox |
		colorBox := assoc value.
		colorBox isArray 
			ifFalse: [ legend text: assoc key withBoxColor: colorBox ] 
			ifTrue: [ string = 'innerBox'
				ifTrue: [ legend text: assoc key withShape: (RSBox new size: 20; paint: ((LinearGradientPaint fromArray: colorBox) start: -20@0; stop: 20@0); yourself) ] 
				ifFalse: [ colorBox first isColor 
					ifTrue: [ legend text: assoc key withShape: (legend defaultBox 
						border: (RSBorder new color: colorBox second);
						paint: colorBox first) ]
					ifFalse: [ legend text: assoc key withFadingRamp: colorBox ] ] ] ].
	legend legendDo: [ :l | l
		padding: 5; 
		scaleBy: 2.5 ].
	blockLocation value: legend.
	legend build