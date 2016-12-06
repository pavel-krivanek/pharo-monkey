testing
canProvideOutputPipe
	"If a subclass is not able to provide pipe output, it may answer false.
	This may happen if output has been redirected to a file."

	^ self pipeFromOutput notNil