testing
hasValidators
	^ self hasElementValidators
		or: [self hasAttributeValidators]