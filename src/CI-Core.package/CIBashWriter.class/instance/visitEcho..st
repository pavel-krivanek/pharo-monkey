visiting
visitEcho: aCIEcho
	
	| absolutePath |
	absolutePath := aCIEcho outputStream asAbsoluteInDirectory: currentStep buildDirectory.
	self writeCommand: 'echo ', aCIEcho text, ' > ', absolutePath fullName