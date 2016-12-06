printing
printOn: aStream

	super printOn: aStream.
	aStream nextPutAll: ' on '.
	self processProxy printOn: aStream
