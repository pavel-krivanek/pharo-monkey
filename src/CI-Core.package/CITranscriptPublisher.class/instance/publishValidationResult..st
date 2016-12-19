publishing
publishValidationResult: aCIValidationResult
	
	Transcript
		<< '================================================================================'; cr;
		<< 'Validation Report: '; << aCIValidationResult change asString; cr;
		<< '================================================================================'; cr.
	
	aCIValidationResult	isSuccess 
			ifTrue:  [ self publishSuccess: aCIValidationResult ]
			ifFalse: [ self publishFailure: aCIValidationResult ].
	
	aCIValidationResult messages isEmpty
		ifFalse: [ self publishMessages: aCIValidationResult ].