testing
atEnd
	"True after processing is complete and all available data has been read from
	the output pipe."

	^ self isComplete
		and: [self outputHasBeenRedirected
				or: [self outputIsExternalStream
					or: [pipeFromOutput atEnd]]]
