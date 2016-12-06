version dependent
localNameFor: path
	"Return the local part the given name."

	^ self useFileSystem
		ifTrue: [ (path perform: #asFileReference) perform: #basename ]
		ifFalse: [(Smalltalk at: #FileDirectory) perform: #localNameFor: with: path]
