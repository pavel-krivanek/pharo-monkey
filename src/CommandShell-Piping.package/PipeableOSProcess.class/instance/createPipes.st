initialize - release
createPipes

	pipeToInput ifNil: [self createInputPipe].
	pipeFromOutput ifNil: [self createOutputPipe].
	pipeFromError ifNil: [self createErrorPipe]
