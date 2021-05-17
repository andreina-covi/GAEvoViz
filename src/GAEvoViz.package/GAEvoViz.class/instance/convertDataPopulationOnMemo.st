as yet unclassified
convertDataPopulationOnMemo 
	| populationsData elementFileData memo |
	populationsData := self readPopulationFile.
	memo := GAMemo new.
	memo processPopulationData: populationsData with: populations.
	(elementsFile notNil and: [ elementsFile notEmpty ])
		ifTrue: [ elementFileData := self readElementFile.
		memo processElementsData: elementFileData.
	].
	^ memo