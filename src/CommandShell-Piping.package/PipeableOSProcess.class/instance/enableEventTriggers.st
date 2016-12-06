event handling
enableEventTriggers
	"Set the output and error streams to be event driven if possible, and 
	answer true if event driven output is supported, otherwise false."

	^ self enableOutputStreamTriggers and: [self enableErrorStreamTriggers]
