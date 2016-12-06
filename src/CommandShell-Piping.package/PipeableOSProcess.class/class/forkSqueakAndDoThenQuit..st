instance creation
forkSqueakAndDoThenQuit: aBlock
	"Start a new instance of Squeak running in a child OS process. The new instance is a
	clone of this image except for the return value of this method. It does not reload the
	image file from disk. The child image evaluates aBlock."

	"PipeableOSProcess forkSqueakAndDoThenQuit:
		[Object inform: 'Hi, I am the child Squeak process. Click OK to exit the child Squeak.']"
	
	^ self
		forkSqueakAndDoThenQuit: aBlock
		errorPipelineStream: InternalPipe nonBlockingPipe
		headless: false
