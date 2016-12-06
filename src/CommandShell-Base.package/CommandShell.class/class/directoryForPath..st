version dependent
directoryForPath: path

	^ self useFileSystem
		ifTrue: [path perform: #asFileReference]
		ifFalse: [(Smalltalk at: #FileDirectory) on: path]
