state-transition
beError: anError
	
	self changeStateFileDoing: [ :str | 
		str
			nextPutAll: 'ERROR';
			nextPutAll: OSPlatform current lineEnding.
		anError signalerContext errorReportOn: str.
	]