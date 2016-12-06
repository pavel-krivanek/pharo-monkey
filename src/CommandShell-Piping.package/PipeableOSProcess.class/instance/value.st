evaluating
value
	"Start the external process"

	| p |
	self errorHasBeenRedirected ifTrue: [self handlePrecedingError].
	accessProtect critical:
		[p := processProxy ifNotNil: [processProxy value].
		"The external child process now owns its own copy of the pipe handles. We no
		longer need our copies of these handles, so close the ones that are not needed."
		p ifNotNil:
			[self keepInitialStdOutOpen ifFalse: [p closeInitialStdOut].
			self keepInitialStdErrOpen ifFalse: [p closeInitialStdErr]]]
