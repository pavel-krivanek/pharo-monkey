printing
printOn: aStream
	super printOn: aStream.
	aStream nextPutAll: self loadFactor asFraction asString.