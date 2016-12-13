helper summary
publishSummary: aValidationResult
	
	self publishSummaryLabels: aValidationResult.
	self stream << '<h3>Validation Setup</h3>'.
	self publishTestParameters: aValidationResult.