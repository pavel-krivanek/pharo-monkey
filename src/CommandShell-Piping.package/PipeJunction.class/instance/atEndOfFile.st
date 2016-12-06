testing
atEndOfFile
	"True after processing is complete and all available data has been read
	from the output pipe. Uses feof() to test for the end of file flag, which
	will have been set by a previous read operation."

	^ pipeFromOutput isNil
		or: [pipeFromOutput atEndOfFile
				and: [self isComplete]]