working directory
workingDirectory: aPathString

	self setCwdIndexFrom: aPathString.
	self cwdDictionary at: self cwdIndex put: aPathString