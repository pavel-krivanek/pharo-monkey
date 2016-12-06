nesting
startElement: anElement
	rootElement
		ifNil: [rootElement := anElement].
	self openElements addLast: anElement.
	self hasScopedAttributes
		ifTrue: [self startScopedAttributes].