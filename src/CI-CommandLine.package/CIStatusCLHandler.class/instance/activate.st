activation
activate

	self stdout nextPutAll: (CIUtils toTerminalString: self mainTask asString).
	self exitSuccess.