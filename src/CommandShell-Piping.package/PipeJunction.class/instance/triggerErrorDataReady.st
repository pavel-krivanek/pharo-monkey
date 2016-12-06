event handling
triggerErrorDataReady

	self triggerEvent: #errorDataReady.
	Processor yield
