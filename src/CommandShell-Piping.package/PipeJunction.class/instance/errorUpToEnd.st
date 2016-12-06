streaming
errorUpToEnd
	"Answer all available characters from my error stream."

	^ (errorPipelineStream isNil or: [self errorHasBeenRedirected])
		ifTrue: ['']
		ifFalse: [errorPipelineStream upToEnd]
