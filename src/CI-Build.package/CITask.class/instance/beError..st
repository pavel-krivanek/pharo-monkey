status
beError: anError
	
	self changeStatusFileDoing: [ :str | 
		str
			nextPutAll: 'ERROR';
			nextPutAll: OSPlatform current lineEnding.
		anError signalerContext errorReportOn: str.
	]