version dependent
directoryNamesInPath: path

	^ self useFileSystem
		ifTrue: [ (path perform: #asFileReference) children	
					select: [:e | e isDirectory ]
					thenCollect: [:e | e perform: #basename] ]
		ifFalse: [ ((Smalltalk at: #FileDirectory) on: path) entries
					select: [:e | e isDirectory ]
					thenCollect: [:e | e name] ]
