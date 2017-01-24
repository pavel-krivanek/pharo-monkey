executing
inDirectory: aDirectory writeStreamDo: aBlockClosure 
	
	(self asAbsoluteInDirectory: aDirectory)
		writeStreamDo: aBlockClosure