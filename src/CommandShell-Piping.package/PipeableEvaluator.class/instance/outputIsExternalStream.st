testing
outputIsExternalStream
	"True if output is being piped to an external proxy, or if output has been
	redirected to a file."

	^ self pipeFromOutput isKindOf: FileStream
