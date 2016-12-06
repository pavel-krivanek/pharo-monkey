event handling
enableOutputStreamTriggers
	"Set the output stream to be event driven if possible, and answer true
	if event driven output is supported, otherwise false."

	(pipeFromOutput notNil and: [pipeFromOutput isPipe])
		ifTrue: [^ pipeFromOutput setBufferedReader]
		ifFalse: [^ false]

