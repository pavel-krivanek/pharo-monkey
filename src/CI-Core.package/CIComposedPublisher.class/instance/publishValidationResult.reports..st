publishing
publishValidationResult: aCIValidationResult reports: reports
	
	self publishers do: [ :publisher | 
			publisher publishValidationResult: aCIValidationResult reports: reports ].
	