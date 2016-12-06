private
validateRootElement: anElement
	(self saxHandler requiresDocumentConstraints
		and: [self validator hasElementValidators not])
		ifTrue: [self errorDocumentConstraintsRequired].

	self validator validateRootElement: anElement.