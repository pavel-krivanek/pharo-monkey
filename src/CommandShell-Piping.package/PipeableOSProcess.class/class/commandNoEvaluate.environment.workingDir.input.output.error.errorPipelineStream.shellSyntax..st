external command processing
commandNoEvaluate: aString environment: anEnvironmentDictionary workingDir: pathString input: inputStream output: outputStream error: errorStream errorPipelineStream: anErrorWriteStream shellSyntax: aSyntaxProcessor
	"Set up the command but do not actually fork the child process."

	"PipeableOSProcess commandNoEvaluate: 'ls -l hosts NOSUCHFILE' environment: nil workingDir: '/etc' input: nil output: nil error: nil errorPipelineStream: (InternalPipe nonBlockingPipe nextPutAll: 'this is the error stream '; yourself) shellSyntax: nil"

	| nameAndArgs proxyClass |
	nameAndArgs := aSyntaxProcessor isNil
		ifTrue:
			[(proxyClass := self externalProxyClass) isNil
				ifTrue:
					[Array with: aString with: Array new]
				ifFalse:
					[Array
						with: proxyClass defaultShellPath
						with: (Array with: '-c' with: aString)]]
		ifFalse:
			[aSyntaxProcessor
				programNameAndArgumentsFrom: aString
				inDirectoryPath: pathString
				findExecutable: true].
	^ nameAndArgs ifNotNil:
		[self new: (nameAndArgs at: 1)
			arguments: (nameAndArgs at: 2)
			environment: anEnvironmentDictionary
			descriptors: (Array with: inputStream with: outputStream with: errorStream)
			workingDir: pathString
			errorPipelineStream: anErrorWriteStream]

