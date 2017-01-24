writing
write: aString 
	
	self writeStream
		nextPutAll: (aString
			copyReplaceAll: String cr
			with: OSPlatform current lineEnding)