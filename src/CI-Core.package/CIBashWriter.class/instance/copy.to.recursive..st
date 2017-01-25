high-level
copy: aFile to: destination recursive: aBoolean
	| recursiveFlag fileToCopy |
	recursiveFlag := aBoolean
		ifTrue: [ '-r' ]
		ifFalse: [ '' ].
	fileToCopy := aFile asFileReference.
	fileToCopy := fileToCopy isAbsolute
		ifTrue: [ fileToCopy fullName ]
		ifFalse: [ '${PWD}/' , aFile asFileReference gtDisplayString ]. 
	self
		writeLine: 'cp {1} {2} {3}'
		format:
			{recursiveFlag.
			fileToCopy.
			destination asFileReference fullName}