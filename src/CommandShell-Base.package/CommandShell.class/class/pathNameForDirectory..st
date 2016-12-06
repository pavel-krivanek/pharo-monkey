version dependent
pathNameForDirectory: directoryOrFileReference
	"Return the full name of this directory."

	^ self useFileSystem
		ifTrue: [directoryOrFileReference fullName]
		ifFalse: [ directoryOrFileReference pathName ]
