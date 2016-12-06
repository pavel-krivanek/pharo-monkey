printing
printOn: aStream

	super printOn: aStream.
	aStream nextPutAll: ' on '.
	self shellBuiltin printOn: aStream