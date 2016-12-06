printing
printOn: aStream

	super printOn: aStream.
	aStream nextPutAll: ' ('; nextPutAll: self runState; nextPut: $)
