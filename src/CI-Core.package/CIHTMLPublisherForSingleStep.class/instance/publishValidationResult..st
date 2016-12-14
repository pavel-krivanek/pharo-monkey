publishing
publishValidationResult: aCIValidationResult
	self
		updateFileName: aCIValidationResult;
		newStream";
		htmlBeginning: aCIValidationResult".
	
	aCIValidationResult stepName ifNotNil: [ :stepName |
		 self stream
		nextPutAll: ('<h2>{1}</h2>' format: {stepName}).
	].

	aCIValidationResult isSuccess
			ifTrue:  [ self publishSuccess: aCIValidationResult ]
			ifFalse: [ self publishFailure: aCIValidationResult ].
	
	self publishChanges: aCIValidationResult change.
	
	aCIValidationResult hasWarnings 
		ifTrue: [ self publishWarnings: aCIValidationResult ].
	aCIValidationResult hasMessages
		ifTrue: [ self publishMessages: aCIValidationResult ].
		
	"self htmlEnding: aCIValidationResult."
	self stream flush; close.