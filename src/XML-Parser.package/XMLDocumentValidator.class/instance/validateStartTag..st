validating
validateStartTag: anElement
	self currentElementValidator
		ifNotNil: [:elementValidator |
			elementValidator validateStartTag: anElement].

	self elementValidatorStack addLast:
		((self elementValidatorFor: anElement)
			ifNil: [
				self
					unvalidatedElement: anElement;
					defaultElementValidatorFor: anElement]).