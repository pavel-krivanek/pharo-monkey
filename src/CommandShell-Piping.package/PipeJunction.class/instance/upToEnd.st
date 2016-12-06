streaming
upToEnd
	"Answer all available characters from the output stream."

	^ (self pipeFromOutput notNil and: [self canProvideOutputPipe])
		ifTrue: [pipeFromOutput upToEnd]
		ifFalse: ['']
