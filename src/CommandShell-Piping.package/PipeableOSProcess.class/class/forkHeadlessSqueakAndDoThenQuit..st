instance creation
forkHeadlessSqueakAndDoThenQuit: aBlock
	"Start a new headless Squeak running in a child OS process. The new instance is a
	clone of this image except for the return value of this method. It does not reload the
	image file from disk. The child image evaluates aBlock."

	"| child |
	child := PipeableOSProcess forkHeadlessSqueakAndDoThenQuit:
		[OSProcess thisOSProcess stdOut
			nextPutAll: 'hello from headless Squeak child ',
				OSProcess thisOSProcess pid asString].
	child upToEndOfFile"
	
	^ self forkSqueakAndDoThenQuit: aBlock
		errorPipelineStream: InternalPipe nonBlockingPipe
		headless: true
