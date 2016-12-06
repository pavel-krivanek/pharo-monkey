instance creation
forkSqueakAndDoThenQuit: aBlock errorPipelineStream: anErrorStream headless: headless bufferedOutput: buffered outputNotifier: aioEventHandler
	"Start a new instance of Squeak running in a child OS process. The new instance is a
	clone of this image except for the return value of this method. It does not reload the
	image file from disk. The child image evaluates aBlock."

	| pp proc parentVmProcess blockWithRedirection |
	pp := super new.
	pp createPipes.
	buffered ifTrue: [pp pipeFromOutput setBufferedReader].
	aioEventHandler ifNotNil: [ buffered
		ifTrue: [self error: 'buffered reader already has AIO handler']
		ifFalse: [aioEventHandler forFileStream: pp pipeFromOutput reader]].
	blockWithRedirection := [
		pp pipeToInput reader setNonBlocking.
		OSProcess thisOSProcess redirectStdInTo: pp pipeToInput reader.
		OSProcess thisOSProcess redirectStdOutTo: pp pipeFromOutput writer.
		OSProcess thisOSProcess redirectStdErrTo: pp pipeFromError writer.
		pp pipeToInput writer close.
		pp pipeFromOutput reader close.
		pp pipeFromError reader close.
		aBlock value].	
	parentVmProcess := OSProcess thisOSProcess.
	proc := headless
				ifTrue: [parentVmProcess forkHeadlessSqueakAndDoThenQuit: blockWithRedirection]
				ifFalse: [parentVmProcess forkSqueakAndDoThenQuit: blockWithRedirection].
	proc pid = parentVmProcess pid
		ifTrue: ["child Squeak - this branch is never reached"]
		ifFalse: ["parent Squeak - set the child Squeak as the process proxy"
			pp errorPipelineStream: anErrorStream.
			pp pipeToInput reader close.
			pp pipeFromOutput writer close.
			pp pipeFromError writer close.
			^ pp processProxy: proc]
