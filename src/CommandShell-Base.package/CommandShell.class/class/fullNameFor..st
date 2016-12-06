version dependent
fullNameFor: fileName
	"Return a corrected, fully-qualified name for the given file name."

	^ self useFileSystem
		ifTrue: [ (fileName perform: #asFileReference) perform: #fullName ]
		ifFalse: [ (Smalltalk at: #FileDirectory) default fullNameFor: fileName ]
