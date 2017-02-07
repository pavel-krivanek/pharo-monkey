printing
printOn: aStream tabbedTimes: aNumberOfTabs

	aNumberOfTabs timesRepeat: [ aStream tab ].
	
	aStream
		nextPutAll: self name;
		nextPutAll: ' - ';
		nextPutAll: self status asString;
		nextPutAll: CIUtils newLineString.
	
	self subtasks do: [ :task |
		task printOn: aStream tabbedTimes: aNumberOfTabs + 1
	]