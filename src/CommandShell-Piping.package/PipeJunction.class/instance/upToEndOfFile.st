streaming
upToEndOfFile
	"Answer all available characters from the output stream. Block and
	continue reading until end of file is detected."

	^ (self pipeFromOutput notNil and: [self canProvideOutputPipe])
		ifTrue: [pipeFromOutput upToEndOfFile]
		ifFalse: ['']
