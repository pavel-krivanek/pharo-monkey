initialize - release
resetStdioStreams
	"After an image restart, call this method to reset to the correct input, output
	and error streams if they are attached to standard input, output or error."

	Smalltalk at: #OSProcess ifPresent:
		[:osp |
		((self pipeToInput respondsTo: #isStdIn) and: [pipeToInput isStdIn])
			ifTrue: [self pipeToInput: osp thisOSProcess stdIn].
		((self pipeToInput respondsTo: #isStdOut) and: [pipeToInput isStdOut])
			ifTrue: [self pipeToInput: osp thisOSProcess stdOut].
		((self pipeToInput respondsTo: #isStdErr) and: [pipeToInput isStdErr])
			ifTrue: [self pipeToInput: osp thisOSProcess stdErr]]
