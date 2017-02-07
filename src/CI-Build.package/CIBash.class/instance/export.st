exporting
export
	
	self path parent ensureCreateDirectory.
	self path exists
		ifTrue: [ self path delete ].
	self path writeStreamDo: [ :stream |
		hasShebang ifTrue: [ 
			stream
				nextPutAll: (self shebangString
					copyReplaceAll: String cr
					with: OSPlatform current lineEnding);
				nextPutAll: OSPlatform current lineEnding ].
		statements do: [ :stmt |
			stream
				nextPutAll: (stmt
					copyReplaceAll: String cr
					with: OSPlatform current lineEnding);
				nextPutAll: OSPlatform current lineEnding ] ]