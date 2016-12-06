testing
isInElement
	^ self openElements size > 0
		or: [self hasExternalRootElement]