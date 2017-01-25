high-level
copyAllIn: aDirectory to: destination recursive: aBoolean
	
	| recursiveFlag |
	recursiveFlag := aBoolean
		ifTrue: [ '-r' ]
		ifFalse: [ '' ].
	self
		writeLine: 'cp {1} {2}/* {3}'
		format: { recursiveFlag. aDirectory outputDirectory fullName. destination fullName }