initialize - release
ensurePipeFromOutput
	"Make sure that an output pipe is provided."

	^ self pipeFromOutput ifNil: [self pipeFromOutput: InternalPipe new]
