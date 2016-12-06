accessing
attributeValidatorsFor: anElement
	^ self doctypeDefinition
		attributeValidatorsAt: anElement
		ifAbsent: [nil]