initialize - release
initialize
	"If pipeFromOutput has been set, then the output stream is being redirected.
	Set a flag to indicate this, otherwise open new a pipe stream to use for output."

	pipeFromOutput isNil
		ifTrue: [self ensurePipeFromOutput]
		ifFalse: [self outputHasBeenRedirected: true].
	^ super initialize
