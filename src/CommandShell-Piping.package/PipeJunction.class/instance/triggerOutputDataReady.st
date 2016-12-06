event handling
triggerOutputDataReady

	self triggerEvent: #outputDataReady.
	Processor yield
