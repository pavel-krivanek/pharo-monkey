publishing
publishFailure: aCIValidationResult 

	self 
		publishList: aCIValidationResult errors
		title: 'Validation Errors:'.
	
	self publishWarnings: aCIValidationResult.