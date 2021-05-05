as yet unclassified
readElementFile
	| content |
	content := OrderedCollection new.
	self elementsFile readStreamDo: [ :stream |
		content := (NeoCSVReader on: stream) skipHeader;
			upToEnd.
	].
	^ content
	