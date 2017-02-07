instance-creation
fromMonkeyFile: aMonkeyFile

	| monkeyFilePath |
	monkeyFilePath := aMonkeyFile asFileReference.
	monkeyFilePath isRelative ifTrue: [ 
		monkeyFilePath := CIUtils pwd / aMonkeyFile ]. 
	
	monkeyFilePath exists ifFalse: [ self error: 'File not found: ', monkeyFilePath fullName ].

	^ OpalCompiler evaluate: monkeyFilePath asFileReference readStream contents