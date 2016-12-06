streaming
errorUpToEndOfFile
	"Answer all available characters from the error stream. Block and
	continue reading until end of file is detected."

	^ (errorPipelineStream isNil or: [self errorHasBeenRedirected])
		ifTrue: ['']
		ifFalse: [errorPipelineStream upToEndOfFile]
