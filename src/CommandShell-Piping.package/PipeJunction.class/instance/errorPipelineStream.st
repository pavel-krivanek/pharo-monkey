accessing
errorPipelineStream
	"Accumulates the error output of commands in a command pipeline."

	errorPipelineStream isNil ifTrue: [errorPipelineStream := InternalPipe nonBlockingPipe].
	^ errorPipelineStream
