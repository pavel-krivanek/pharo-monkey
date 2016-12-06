accessing
pipeFromError: aPipeStream

	(pipeFromError := aPipeStream)
		ifNotNil: [pipeFromError addDependent: self]
