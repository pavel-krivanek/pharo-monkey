accessing
errorPipelineStream
	"Accumulates the error output of commands in a command pipeline."

	self isEmpty
		ifTrue: [^ nil]
		ifFalse: [^ self last errorPipelineStream]