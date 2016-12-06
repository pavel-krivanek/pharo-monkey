instance creation
forkAndExec: executableFile arguments: arrayOfStrings environment: stringDictionary descriptors: arrayOf3Streams workingDir: pathString errorPipelineStream: anErrorStream
	"Run a program in an external OS process, and answer an instance of myself
	which represents the external process."

	"PipeableOSProcess forkAndExec: '/bin/ls' arguments: #('-ls' 'hosts' 'NOSUCHFILE') environment: nil descriptors: nil workingDir: '/etc' errorPipelineStream: (InternalPipe nonBlockingPipe nextPutAll: 'this is the error stream '; yourself)"

	^ self canAccessOSProcess
		ifTrue:
			[(self new: executableFile
			arguments: arrayOfStrings
			environment: stringDictionary
			descriptors: arrayOf3Streams
			workingDir: pathString
			errorPipelineStream: anErrorStream) value; yourself]
		ifFalse:
			[self notify: 'OSProcess not available or OSProcess plugin not functioning']
