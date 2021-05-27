accessing
readHeaderAndContentFrom: fileReference
	| content header |
	content := OrderedCollection new.
	fileReference readStreamDo: [ :stream |
		header := (NeoCSVReader on: stream) readHeader. 
		content := (NeoCSVReader on: stream) upToEnd.
	].
	^ Array with: header with: content
	