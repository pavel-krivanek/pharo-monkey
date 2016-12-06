version dependent
fileExists: fileName inPath: path
	"Answer true if a file of the given name exists in the directory named by path."

	^ self useFileSystem
		ifTrue: [ self fileExists: fileName inDirectory: (path perform: #asFileReference) ]
		ifFalse: [ self fileExists: fileName inDirectory: ((Smalltalk at: #FileDirectory) on: path) ]
