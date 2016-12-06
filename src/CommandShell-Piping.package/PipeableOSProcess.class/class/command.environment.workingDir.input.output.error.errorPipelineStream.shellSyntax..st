external command processing
command: aString environment: anEnvironmentDictionary workingDir: pathString input: inputStream output: outputStream error: errorStream errorPipelineStream: anErrorWriteStream shellSyntax: aSyntaxProcessor

	"(PipeableOSProcess command: 'ls -l hosts NOSUCHFILE' environment: nil workingDir: '/etc' input: nil output: nil error: nil errorPipelineStream: (InternalPipe nonBlockingPipe nextPutAll: 'this is the error stream '; yourself) shellSyntax: nil) output"

	| p |
	p := self
		commandNoEvaluate: aString
		environment: anEnvironmentDictionary
		workingDir: pathString
		input: inputStream
		output: outputStream
		error: errorStream
		errorPipelineStream: anErrorWriteStream
		shellSyntax: aSyntaxProcessor.
	p pipeFromOutput setBufferedReader.
	(Delay forMilliseconds: 1) wait. "context switch to enable buffered reader"
	p value.
	^p
