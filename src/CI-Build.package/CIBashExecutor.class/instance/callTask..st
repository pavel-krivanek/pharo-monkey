executing
callTask: aCITask 
	
	self
		runManaged: ('bash {1}/{2}' format: {aCITask baseDirectory fullName . self buildFileName});
		copy: aCITask outputDirectory / '.' to: self currentTask buildDirectory;
		newLine.