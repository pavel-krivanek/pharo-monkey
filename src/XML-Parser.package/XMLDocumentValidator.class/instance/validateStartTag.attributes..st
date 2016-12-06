validating
validateStartTag: anElement attributes: aDictionary
	(self hasElementValidators
		or: [self hasAttributeValidators])
		ifTrue: [
			self validateStartTag: anElement.
			self
				validateAttributes: aDictionary
				with: (self attributeValidatorsFor: anElement)]