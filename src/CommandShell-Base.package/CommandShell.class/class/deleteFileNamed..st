version dependent
deleteFileNamed: fileName
	"Delete the file with the given name."

	self useFileSystem
		ifTrue: [ | file |
			file := fileName perform: #asFileReference.
			(file respondsTo: #ensureDeleted)
				ifTrue: [ file perform: #ensureDeleted ]
				ifFalse: [ file perform: #delete ] ]
		ifFalse: [ (Smalltalk at: #FileDirectory) default
				deleteFileNamed: fileName ]
