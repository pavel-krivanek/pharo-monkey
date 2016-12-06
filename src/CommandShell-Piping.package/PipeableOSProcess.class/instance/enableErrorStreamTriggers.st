event handling
enableErrorStreamTriggers
	"Set the error stream to be event driven if possible, and answer true
	if event driven output is supported, otherwise false."

	| err |
	(err := pipeFromError)
		ifNotNil: [^ err setBufferedReader].
	^ false