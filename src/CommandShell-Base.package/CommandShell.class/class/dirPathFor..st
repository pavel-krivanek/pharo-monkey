version dependent
dirPathFor: path
	"Return the directory part the given name."

	^ self useFileSystem
		ifTrue: [ (path perform: #asFileReference) parent fullName ]
		ifFalse: [(Smalltalk at: #FileDirectory) perform: #dirPathFor: with: path]
