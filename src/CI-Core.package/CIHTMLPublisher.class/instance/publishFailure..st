publishing
publishFailure: aCIValidationResult

	self stream
		nextPutAll: '<h3 style="color:red"><span class="glyphicon glyphicon-remove"></span> Failure</h3>'.
	self publishSummary: aCIValidationResult.
	
	self publishFailures: aCIValidationResult