validating
validateComment: aString
	self hasElementValidators
		ifTrue: [
			self currentElementValidator
				ifNotNil: [:elementValidator |
					elementValidator validateComment: aString]]