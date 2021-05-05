as yet unclassified
convertDataPopulationOnMemo 
	| populationsData elementFileData memo |
	populationsData := self readPopulationFile.
	memo := GAMemo new.
	memo processPopulationData: populationsData with: populations.
	elementFileData := self readElementFile.
	memo processElementsData: elementFileData.
	^ memo