instance creation
forkSqueakAndDoThenQuit: aBlock errorPipelineStream: anErrorStream headless: headless bufferedOutput: buffered
	"Start a new instance of Squeak running in a child OS process. The new instance is a
	clone of this image except for the return value of this method. It does not reload the
	image file from disk. The child image evaluates aBlock."

	^ self
		forkSqueakAndDoThenQuit: aBlock
		errorPipelineStream: anErrorStream
		headless: headless
		bufferedOutput: buffered
		outputNotifier: nil