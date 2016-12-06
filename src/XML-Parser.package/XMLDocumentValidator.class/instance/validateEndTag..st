validating
validateEndTag: anElement
	self hasElementValidators
		ifTrue: [
			self currentElementValidator
				ifNotNil: [:elementValidator |
					elementValidator atEnd
						ifFalse: [self errorUnexpectEndOfElement: anElement].
					self elementValidatorStack removeLast]]