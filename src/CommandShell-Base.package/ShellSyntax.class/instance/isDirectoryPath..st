platform dependent
isDirectoryPath: aPathString

	| fullPath localName entry |
	^ (('*', CommandShell pathSeparator) match: aPathString) or:
		[fullPath := CommandShell fullNameFor: aPathString.
		localName := CommandShell localNameFor: fullPath.
		[entry := CommandShell useFileSystem
			ifTrue: [entry := ((CommandShell dirPathFor: fullPath) perform: #asFileReference) entries
						detect: [:e | e basename = localName] ifNone: [nil]]
			ifFalse: [entry := ((Smalltalk at: #FileDirectory) on: (CommandShell dirPathFor: fullPath)) entries
						detect: [:e | e name = localName] ifNone: [nil]]]
					on: Error
					do: [: ex | ^false].
		entry notNil and: [entry isDirectory]]
