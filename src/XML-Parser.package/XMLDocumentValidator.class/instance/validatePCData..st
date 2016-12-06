validating
validatePCData: aString
	self hasElementValidators
		ifTrue: [self currentElementValidator validatePCData: aString]