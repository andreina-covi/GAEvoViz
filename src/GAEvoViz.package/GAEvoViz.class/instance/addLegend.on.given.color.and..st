adding
addLegend: associations on: canvas given: string color: color and: blockLocation
	| legend |
	legend := RSLegend new 
		container: canvas;
		defaultLabel: (RSLabel new color: color; yourself);
		yourself.
	associations do: [ :assoc |
		string = 'similarity'
			ifTrue: [ legend text: assoc key withShape: (RSLine new color: assoc value; width: 4; yourself; startPoint: 30@0; endPoint: 0@0; yourself) ] 
			ifFalse: [ legend text: assoc key withBoxColor: assoc value ] ].
	legend legendDo: [ :l | l
		padding: 5; 
		scaleBy: 2.5 ].
	blockLocation value: legend.
	legend build