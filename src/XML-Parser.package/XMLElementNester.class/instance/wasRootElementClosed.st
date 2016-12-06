testing
wasRootElementClosed
	self openElements size > 0
		ifTrue: [^ false].
	self rootElement
		ifNil: [^ false].
	self hasExternalRootElement
		ifTrue: [^ false].
	^ true.