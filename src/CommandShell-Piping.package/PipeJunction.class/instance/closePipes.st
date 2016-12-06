initialize - release
closePipes

	self closeOutput.
	pipeToInput ifNotNil: [pipeToInput close].
	self errorHasBeenRedirected ifTrue: [errorPipelineStream close]
