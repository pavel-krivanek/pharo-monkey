accessing
errorPipelineStream: aStream
	"Accumulates the error output of commands in a command pipeline."

	errorPipelineStream ifNotNil: [errorPipelineStream removeDependent: self].
	errorPipelineStream := aStream.
	errorPipelineStream ifNotNil: [errorPipelineStream addDependent: self]
