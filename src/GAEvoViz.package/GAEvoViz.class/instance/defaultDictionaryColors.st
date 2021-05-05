as yet unclassified
defaultDictionaryColors 
	^ Dictionary new 
		at: 'background' put: Color white;
		"at: 'backgroundTestCase' put: (Color r: 0.1607843137254902 g: 0.3686274509803922 b: 0.4470588235294118);"
		at: 'backgroundBox' put: (Color fromHexString: 'ebecf0');
		"at: 'backgroundHigherFitnessTestCase' put: (Color fromHexString: '1B8D8D' '0B6969' '1E7676');"
		at: 'borderBox' put: (Color r: 0.1607843137254902 g: 0.3686274509803922 b: 0.4470588235294118);
		at: 'scaleLighter' put: (Color r: 0 g: 1 b: 0.67);
		at: 'scaleDarker' put: (Color r: 0 g: 0 b: 0 alpha: 0.1)"(Color r: 0.30980392156862746 g: 0.6235294117647059 b: 0.49019607843137253)";
		at: 'baseBar' put: Color white;
		at: 'forwardBar' put: (Color r: 0.611764705882353 g: 0.6431372549019608 b: 0.6274509803921569);
		at: 'backwardBar' put: (Color r: 1 g: 0 b: 0.25098039215686274);
		at: 'edge' put: (Color r: 0.611764705882353 g: 0.6431372549019608 b: 0.6274509803921569);
		at: 'firstRing' put: (Color r: 0.05 g: 0.75 b: 0.91);
		at: 'secondRing' put: (Color r:0.88 g:0.26 b:0.5);
		at: 'thirdRing' put: (Color r: 0 g: 1 b: 0.67);
		at: 'highlightBox' put: (Color r: 0.13725490196078433 g: 0.7215686274509804 b: 0.7725490196078432 alpha: 0.8);
		at: 'highlightInnerBox' put: Color cyan"(Color r: 111/255 g: 1 b: 233/255)";
		"at: 'fontMethodBox' put: Color white;"
		at: 'fontMethodBox' put: Color black;
		at: 'fontBox' put: Color black;
		at: 'border' put: Color transparent "(Color r: 0.12549019607843137 g: 0.1803921568627451 b: 0.23529411764705882)";
		at: 'axis' put: (Color r: 0.12549019607843137 g: 0.1803921568627451 b: 0.23529411764705882);
		at: 'fittestFitness' put: (Color r: 0 g: 1 b: 0.67);
		at: 'averageFitness' put: (Color r: 0.5063538611925709 g: 0.5259042033235581 b: 0.8357771260997068);
		at: 'lowestFitness' put: (Color pink);
		at: 'seedCoverage' put: (Color r: 0.9530791788856305 g: 0.5102639296187683 b: 0.43499511241446726);
		at: 'font' put: (Color r: 0.12549019607843137 g: 0.1803921568627451 b: 0.23529411764705882);
		at: 'rangeInnerBoxColor' put:
			(#('83142C' 'AF0404' 'BB1542' 'ED3833' 'EB5F5D' 'F3826F' 'FFBA92' 'F0DAB1' 'FFF8CD' 'F7FF56' 'DCFFCC' 'DDF796' 'C3F584' 'A3F7BF' '6bffb8' '42E6A4' '4DD599' '71A95A' '007944' '00818A' '216583' '366ED8' '64C4ED' '5EDFFF' 'B2FCFF' 'FFEDFF' 'C6CBEF' '8186D5' '494CA2' '560764' '930077' 'D527B7' 'FF78AE' 'FFA0D2' ) collect: [:c | Color fromHexString: c ]);
		at: 'edgeSimilarity' put: (Color r: 0.12903225806451613 g: 0.39589442815249265 b: 0.5141739980449658);
		at: 'testcaseNode' put: (Color transparent);
		at: 'markedBoxNode' put: (Color r: 0 g: 1 b: 0.67);
		at: 'boxFontColor' put: (Color black);
		at: 'fontBar' put: Color black;
		yourself.