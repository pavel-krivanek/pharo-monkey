testing
atEnd
	"True after processing is complete and all available data has been read from
	the output pipe."

	^ pipeFromOutput atEnd and: [self isComplete]
