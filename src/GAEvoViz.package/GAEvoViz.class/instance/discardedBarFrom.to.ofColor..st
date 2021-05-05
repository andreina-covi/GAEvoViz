running
discardedBarFrom: progressValue to: maxValue ofColor: dictColor
	| groupBox groupData bar scale |
	groupBox := RSGroup new.
	groupData := RSGroup new.
	scale := NSScale linear domain: (Array with: 0 with: maxValue);
		range: (Array with: 0 with: 200).
	groupBox 
		add: (RSBox new height: 50; color: (dictColor at: 'baseBar'); width: (scale scale: progressValue));
		add: (RSBox new height: 50; color: (dictColor at: 'forwardBar'); width: (scale scale: (maxValue - progressValue)); withBorder).
	RSHorizontalLineLayout new gapSize: 0; on: groupBox.
	bar := RSComposite new
		shapes: groupBox;
		yourself.
	groupData 
		add: bar;
		add: (RSLabel new text: (maxValue - progressValue) asString; color: (dictColor at: 'fontBar'); fontSize: 30).
	RSHorizontalLineLayout new gapSize: 10; on: groupData.
	^ RSComposite new shapes: groupData