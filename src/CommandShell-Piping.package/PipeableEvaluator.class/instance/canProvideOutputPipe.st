testing
canProvideOutputPipe
	"Answer false if output has been redirected to a file and cannot be accessed by
	the next process proxy in a command pipeline."

	^ super canProvideOutputPipe and: [self outputHasBeenRedirected not]
