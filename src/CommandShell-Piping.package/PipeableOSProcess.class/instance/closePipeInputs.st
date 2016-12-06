initialize - release
closePipeInputs
	"Close all pipe endpoints not used after process termination."

	super closePipeInputs.
	pipeFromError ifNotNil: [pipeFromError closeWriter]
