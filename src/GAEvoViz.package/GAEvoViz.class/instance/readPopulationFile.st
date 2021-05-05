as yet unclassified
readPopulationFile
	| content header |
	content := OrderedCollection new.
	self populationFile readStreamDo: [ :stream |
		header := (NeoCSVReader on: stream) readHeader. 
		content := (NeoCSVReader on: stream) upToEnd.
	].
	^ Array with: header with: content
	