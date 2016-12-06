version dependent
fileExists: fileName inDirectory: directoryOrFileReference
	"Answer true if a file of the given name exists in this directory."

	^ self useFileSystem
		ifTrue: [ (directoryOrFileReference entries
					detect: [:e | e basename = fileName] ifNone: []) notNil ]
		ifFalse: [ directoryOrFileReference fileExists: fileName ]
