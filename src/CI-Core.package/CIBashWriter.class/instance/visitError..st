visiting
visitError: aCIErrorOperation 
	
	self writeCommand: 'exit {1}' format: { aCIErrorOperation errorCode }