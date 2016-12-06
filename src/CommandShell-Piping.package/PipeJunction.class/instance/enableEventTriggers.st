event handling
enableEventTriggers
	"Set the output stream to be event driven if possible, and answer true if
	event driven output is supported, otherwise false. See #update: for event
	triggering logic."

	^ self enableOutputStreamTriggers
