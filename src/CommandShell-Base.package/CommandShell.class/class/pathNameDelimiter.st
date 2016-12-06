version dependent
pathNameDelimiter

	^ self useFileSystem
		ifTrue: [(Smalltalk at: #DiskStore) current perform: #delimiter]
		ifFalse: [(Smalltalk at: #FileDirectory) pathNameDelimiter]
