testing
pipesAreEmpty
	"True after processing is complete and all available data has been read 
	from the output pipe and the errorPipelineStream pipe."

	^ self atEndOfFile
		and: [self errorHasBeenRedirected
				or: [errorPipelineStream atEnd]]