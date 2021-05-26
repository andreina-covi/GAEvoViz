as yet unclassified
readContent: fileReference
	| content |
	content := OrderedCollection new.
	fileReference readStreamDo: [ :stream |
		content := (NeoCSVReader on: stream) skipHeader;
			upToEnd.
	].
	^ content
	