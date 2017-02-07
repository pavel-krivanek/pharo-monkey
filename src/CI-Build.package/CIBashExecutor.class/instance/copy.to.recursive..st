executing
copy: aFilePath to: aDestinationPath recursive: aBoolean
	| recursiveFlag |
	recursiveFlag := aBoolean
		ifTrue: [ '-r' ]
		ifFalse: [ '' ].

	self currentBashFile addStatement: ('cp {1} {2} {3}'
		format:
			{recursiveFlag.
			CIUtils bashPathOf: aFilePath relativeTo: self currentTask buildDirectory.
			CIUtils bashPathOf: aDestinationPath })