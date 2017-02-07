executing
checkPreviousStatus
	
	self execute: [ 
		checksStatus := true.
		^ CINonExecutedState new ]