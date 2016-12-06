printing
printOn: aStream

	self background
		ifTrue: [aStream nextPutAll: 'a background ']
		ifFalse: [aStream nextPutAll: 'a foreground '].
	aStream nextPutAll: self class name, ' for "', self commandLine asString, '"'