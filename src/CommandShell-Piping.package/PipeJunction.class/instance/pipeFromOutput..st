accessing
pipeFromOutput: aPipeStream

	(pipeFromOutput := aPipeStream)
		ifNotNil: [pipeFromOutput addDependent: self]
