external command processing
command: aString environment: anEnvironmentDictionary workingDir: pathString input: inputStream output: outputStream error: errorStream errorPipelineStream: anErrorWriteStream

	"(PipeableOSProcess command: 'ls -l hosts NOSUCHFILE' environment: nil workingDir: '/etc' input: nil output: nil error: nil errorPipelineStream: (InternalPipe nonBlockingPipe nextPutAll: 'this is the error stream '; yourself)) output"

	^ self command: aString
		environment: anEnvironmentDictionary
		workingDir: pathString
		input: inputStream
		output: outputStream
		error: errorStream
		errorPipelineStream: anErrorWriteStream
		shellSyntax: nil
