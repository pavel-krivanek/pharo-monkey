state-transition
beExecuting
	
	self changeStateFileDoing: [ :str |
		str nextPutAll: 'EXECUTING' ]