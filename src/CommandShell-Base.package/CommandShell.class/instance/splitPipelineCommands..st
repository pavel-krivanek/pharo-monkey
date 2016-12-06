command support
splitPipelineCommands: aCommand
	"Answer a list of the individual commands in a command pipeline string,
	delimited by the pipe character."

	^ self shellSyntax splitPipelineCommands: aCommand
