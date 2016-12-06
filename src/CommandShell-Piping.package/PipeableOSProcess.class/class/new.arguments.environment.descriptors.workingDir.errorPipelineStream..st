instance creation
new: executableFile arguments: arrayOfStrings environment: stringDictionary descriptors: arrayOf3Streams workingDir: pathString errorPipelineStream: anErrorStream
	"Prepare to run a program in an external OS process, and answer an instance of
	myself which will represent the external process."

	"PipeableOSProcess new: '/bin/ls' arguments: #('-ls' 'hosts' 'NOSUCHFILE') environment: nil descriptors: nil workingDir: '/etc' errorPipelineStream: (InternalPipe nonBlockingPipe nextPutAll: 'this is the error stream '; yourself)"

	"PipeableOSProcess new: 'sol' arguments: nil environment: nil descriptors: nil workingDir: nil errorPipelineStream: (InternalPipe nonBlockingPipe nextPutAll: 'this is the error stream '; yourself)"

	| pp proc proxyClass s |
	pp := super new.
	(proxyClass := self externalProxyClass) ifNotNil:
		[proc := proxyClass
			programName: executableFile
			arguments: arrayOfStrings
			initialEnvironment: stringDictionary].
	proc ifNil: [^ self notify: 'OSProcess not available'].
	arrayOf3Streams isNil
		ifTrue:
			[pp createPipes.
			proc initialStdIn: pp pipeToInput reader.
			proc initialStdOut: pp pipeFromOutput writer.
			proc initialStdErr: pp pipeFromError writer]
		ifFalse:
			[(s := (arrayOf3Streams at: 1)) isNil
				ifTrue:
					[pp createInputPipe.
					proc initialStdIn: pp pipeToInput reader]
				ifFalse:
					[proc initialStdIn: s].
			(s := (arrayOf3Streams at: 2)) isNil
				ifTrue:
					[pp createOutputPipe.
					proc initialStdOut: pp pipeFromOutput writer]
				ifFalse:
					[proc initialStdOut: s].
			(s := (arrayOf3Streams at: 3)) isNil
				ifTrue:
					[pp createErrorPipe.
					proc initialStdErr: pp pipeFromError writer]
				ifFalse:
					[proc initialStdErr: s]].
	pathString ifNotNil: [proc pwd: pathString].
	pp errorPipelineStream: anErrorStream.
	pp initialize.
	proc initialize.
	^ pp processProxy: proc
