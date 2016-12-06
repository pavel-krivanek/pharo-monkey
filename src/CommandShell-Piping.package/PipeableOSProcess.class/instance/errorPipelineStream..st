accessing
errorPipelineStream: aStream
	"Accumulates the error output of commands in a command pipeline. Overridden
	to eliminate setting self as a dependent of the error pipeline stream."

	errorPipelineStream := aStream
