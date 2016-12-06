initialize - release
initialize

	(self requiresNonBlockingInput and: [pipeToInput isKindOf: OSPipe])
		ifTrue:[pipeToInput setNonBlocking]
			
