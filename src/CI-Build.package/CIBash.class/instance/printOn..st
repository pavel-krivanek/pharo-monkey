printing
printOn: aStream

	super printOn: aStream.
	aStream nextPut: $(.
	aStream nextPutAll: self path gtDisplayString.
	aStream nextPut: $)