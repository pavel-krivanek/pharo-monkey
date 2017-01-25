visiting
visitEcho: aCIEcho
	
	self echo: aCIEcho text toFile: (aCIEcho outputStream asAbsoluteInDirectory: currentStep buildDirectory)