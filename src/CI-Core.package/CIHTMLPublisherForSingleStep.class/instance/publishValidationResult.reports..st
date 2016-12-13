publishing
publishValidationResult: aCIValidationResult reports: reports

	self
		updateFileName: aCIValidationResult;
		newStream;
		htmlBeginning: aCIValidationResult.

	 self stream nextPutAll: '<h2>Overall result:</h2>'.
	
	aCIValidationResult isSuccess
			ifTrue:  [ self publishSuccess: aCIValidationResult ]
			ifFalse: [ self publishFailure: aCIValidationResult ].
	
	reports do: [ :report |
		[ report atEnd ] whileFalse: [ 
			self stream binary nextPut: report next ]].
		
	self htmlEnding: aCIValidationResult.
	self stream close.