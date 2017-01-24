executing
executeIn: aCIStep 
	
	self outputStream
		inDirectory: aCIStep buildDirectory
		writeStreamDo: [ :str | str nextPutAll: text ]