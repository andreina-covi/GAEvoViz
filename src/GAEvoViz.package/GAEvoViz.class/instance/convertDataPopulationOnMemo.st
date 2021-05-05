as yet unclassified
convertDataPopulationOnMemo 
	| populationsData elementFileData memo |
	populationsData := self readPopulationFile.
	memo := GAMemo new.
	self assert: populationsData size == populations size.
	memo processPopulationData: populationsData with: populations.
	elementFileData := self readElementFile.
	memo processElementsData: elementFileData