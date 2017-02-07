status
beExecuting
	
	self changeStatusFileDoing: [ :str |
		str nextPutAll: 'EXECUTING' ]