publishing
publishValidationResult: aCIValidationResult

	| full |
	
	full := aCIValidationResult subreports notEmpty.

	self
		updateFileName: aCIValidationResult;
		newStream.
	full ifTrue: [ 
		self htmlBeginning: aCIValidationResult. ].

	aCIValidationResult stepName ifNotNil: [ :stepName |
		 self stream nextPutAll: ('<h2>{1}</h2>' format: {stepName}).
	].

	aCIValidationResult isSuccess
			ifTrue:  [ self publishSuccess: aCIValidationResult ]
			ifFalse: [ self publishFailure: aCIValidationResult ].
	
	self publishChanges: aCIValidationResult change.
	
	aCIValidationResult hasWarnings 
		ifTrue: [ self publishWarnings: aCIValidationResult ].
	aCIValidationResult hasMessages
		ifTrue: [ self publishMessages: aCIValidationResult ].
		
	full ifTrue: [
		aCIValidationResult subreports do: [ :report |
			[ report atEnd ] whileFalse: [ 
				self stream binary nextPut: report next ]].

		self htmlEnding: aCIValidationResult.].
	
	self stream flush; close.