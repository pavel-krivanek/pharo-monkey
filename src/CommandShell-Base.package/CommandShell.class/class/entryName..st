version dependent
entryName: directoryEntry
	"Answer the name of a directory entry."

	^ self useFileSystem
		ifTrue: [ directoryEntry basename ]
		ifFalse: [ directoryEntry name ]
