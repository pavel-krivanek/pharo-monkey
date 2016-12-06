event handling
handleRedirectedOutputOf: predecessorProxy
	"If the output of predecessorProxy (in a pipeline) has been redirected,
	this pipe junction will not know when predecessorProxy has completed
	unless it requests notification. The pipe to input of this pipe junction should
	not be closed until predecessorProxy is complete, so close the pipe when the
	completion event occurs."

	predecessorProxy ifNotNil:
		[(predecessorProxy canProvideOutputPipe not
			and: [self inputHasBeenRedirected not]) ifTrue:
				[self pipeToInput
					ifNotNil:
						[predecessorProxy
							when: #complete
							send: #close
							to: pipeToInput writer]]]
