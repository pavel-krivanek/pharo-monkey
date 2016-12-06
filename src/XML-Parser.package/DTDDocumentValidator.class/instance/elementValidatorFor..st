accessing
elementValidatorFor: anElement
	^ (self doctypeDefinition
		elementValidatorsAt: anElement
		ifAbsent: [nil]) copy