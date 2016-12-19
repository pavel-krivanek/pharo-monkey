publishing
publishSuccess: aCIValidationResult 

	Transcript
		<< 'Validation Success: ';
		<< aCIValidationResult change asString; cr.
	
	self publishWarnings: aCIValidationResult.