instance creation
command: aString pipeFrom: inputStream errorPipelineStream: errorStream

	"(self command: 'stdout nextPutAll: stdin upToEnd'
		pipeFrom: (ReadStream on: 'Here is some input text')
		errorPipelineStream: InternalPipe nonBlockingPipe)
			value upToEnd"

	^ self command: aString pipeFrom: inputStream pipeTo: nil errorPipelineStream: errorStream