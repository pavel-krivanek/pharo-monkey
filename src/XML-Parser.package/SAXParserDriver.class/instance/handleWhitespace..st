handling
handleWhitespace: aString
	(self isValidating
		and: [self validator hasElementValidators])
		ifTrue: [
			self validator currentElementIgnoresWhitespace
				ifTrue: [
					(self elementNester hasScopedAttributes
						and: [
							(self elementNester scopedAttributeAt: 'xml:space') =
								'preserve'])
						ifTrue: [self saxHandler characters: aString]
						ifFalse: [self saxHandler ignorableWhitespace: aString].
					^ self].
			self validator validatePCData: aString].
	self saxHandler characters: aString.