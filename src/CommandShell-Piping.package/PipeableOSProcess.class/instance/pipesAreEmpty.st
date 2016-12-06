testing
pipesAreEmpty
	"True after processing is complete and all available data has been read 
	from the output pipe and the error pipe. Note: uses error handling 
	rather than testing for pipe closed to avoid race condition."

	^ (self atEndOfFile
			and: [pipeFromError isNil
					or: [pipeFromError atEndOfFile]])
		and: [errorPipelineStream atEnd]