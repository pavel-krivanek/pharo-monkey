version dependent
fileNamed: fileName inDirectory: directoryOrFileReference
	"Open the file with the given name in this directory for writing."

	^ self useFileSystem
		ifTrue: [(directoryOrFileReference files
						detect: [:e | e basename = fileName ]
						ifNone: [ ])
					ifNotNilDo: [:f | f writeStream ]]
		ifFalse: [ directoryOrFileReference fileNamed: fileName ]
