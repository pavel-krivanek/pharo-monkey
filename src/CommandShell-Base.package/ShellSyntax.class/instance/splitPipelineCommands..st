command string parsing
splitPipelineCommands: aCommand
	"Answer a list of the individual commands in a command pipeline string,
	delimited by the pipe character."

	^ (aCommand findTokens: self pipeCharToken) collect: [:e | CommandShell withBlanksTrimmed: e]
