instance-creation
fromMonkeyFile: aMonkeyFile
	
	| monkeyFilePath |
	monkeyFilePath := aMonkeyFile.
	aMonkeyFile isRelative ifTrue: [ 
		monkeyFilePath := self pwd / aMonkeyFile ]. 
	
	monkeyFilePath exists ifFalse: [ self error: 'File not found: ', monkeyFilePath fullName ].
	
	^ OpalCompiler evaluate: monkeyFilePath readStream contents