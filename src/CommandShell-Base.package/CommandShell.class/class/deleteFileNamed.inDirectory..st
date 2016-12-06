version dependent
deleteFileNamed: fileName inDirectory: directoryOrFileReference
	"Delete the file with the given name in the given directory."

	^ self useFileSystem
		ifTrue: [(directoryOrFileReference files
						detect: [:e | e basename = fileName ]
						ifNone: [ ])
					ifNotNilDo: [:f | f delete ]]
		ifFalse: [ directoryOrFileReference deleteFileNamed: fileName ]
