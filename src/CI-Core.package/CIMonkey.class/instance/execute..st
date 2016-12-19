running
execute: aBlock

	^ [	 | result |
		result := aBlock value. 
		(result isKindOf: CIValidationResult)
			ifTrue: [ result ]
			ifFalse: [ CIValidationResult change: self issue ].
	] on: MCMergeResolutionRequest, Error, Warning, Halt do: [ :anException |
		self publisher error: anException.
		(CIValidationResult change: self issue)
			addError: anException;
			yourself ]
