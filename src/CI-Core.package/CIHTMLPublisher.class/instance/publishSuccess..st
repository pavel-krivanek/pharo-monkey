publishing
publishSuccess: aCIValidationResult

	self stream
		nextPutAll: '<h3 style="color:green"><span class="glyphicon glyphicon-ok"></span> Success</h3>'.
	self publishSummary: aCIValidationResult.