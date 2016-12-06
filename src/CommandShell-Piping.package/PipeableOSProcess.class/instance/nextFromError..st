streaming
nextFromError: count
	"Answer up to count characters from the error stream of my external process,
	or an empty string if no data is available. All characters are routed through
	the errorPipelineStream, so that they are concatenated with any preceeding
	error message text (possibly from a preceeding process in a command pipeline)."

	self updateErrorPipelineStream.
	^ self errorHasBeenRedirected
		ifTrue: [nil]
		ifFalse: [self errorPipelineStream next: count]
