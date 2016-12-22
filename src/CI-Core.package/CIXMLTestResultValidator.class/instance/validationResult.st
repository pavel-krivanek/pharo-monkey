instance creation
validationResult

	| result |
	
	result := CIValidationResult change: nil.
	errors do: [:each | result addError: (self descriptionFor: each) ].
	failures do: [:each | result addError: (self descriptionFor: each) ].
	
	^ result
	

	
