accessing
convertDataPopulationOnMemo 
	| populationsData elementFileData memo |
	populationsData := self readHeaderAndContentFrom: self populationFile.
	memo := GAMemo new.
	memo processPopulationData: populationsData with: populations.
	"(elementsFile notNil and: [ elementsFile notEmpty ])
		ifTrue: [ elementFileData := self readContent: self elementsFile.
		memo processElementsData: elementFileData.
	]."
	^ memo