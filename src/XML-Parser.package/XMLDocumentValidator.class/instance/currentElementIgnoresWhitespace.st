testing
currentElementIgnoresWhitespace
	self currentElementValidator
		ifNotNil: [:elementValidator |
			^ elementValidator ignoresWhitespace].
	^ false.