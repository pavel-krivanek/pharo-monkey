nesting
endElement: anElement
	self openElements removeLast.
	self hasScopedAttributes
		ifTrue: [self endScopedAttributes].