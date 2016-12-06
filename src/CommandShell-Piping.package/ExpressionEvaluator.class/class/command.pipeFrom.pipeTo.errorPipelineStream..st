instance creation
command: aString pipeFrom: inputStream pipeTo: outputStream errorPipelineStream: errorStream

	"(self command: 'stdout nextPutAll: stdin contents'
		pipeFrom: (ReadStream on: 'Here is some input text')
		pipeTo: nil
		errorPipelineStream: InternalPipe nonBlockingPipe)
			value upToEnd"

	^ super new
		expression: aString;
		pipeToInput: inputStream;
		pipeFromOutput: outputStream;
		errorPipelineStream: errorStream;
		notYetRunning;
		initialize