process proxy creation
processProxyFor: aCommandString input: in output: out error: err predecessorProxy: lastProxy
	"Answer a proxy for an external OS command process. Note that the sender is
	responsible for closing the input pipe. Under certain conditions, reading up to
	end on a proxy can deadlock the VM if the input pipe remains open."

	"CommandShell new processProxyFor: '/bin/sh' input: nil output: nil error: nil predecessorProxy: nil"

	| input newInputPipe errorPipelineStream p proxy |
	self canAccessOSProcess
		ifFalse:
			["Answer a doIt proxy with an error message. Call it this way to make sure that
			the error streams get wired up correctly"
			p := self pipeableProxyFor: 'String new: 0 ! '
					input: in
					output: out
					error: err
					predecessorProxy: lastProxy.
			p errorPipelineStream nextPutAll:
				'cannot access system to run ''', aCommandString, '''', Character cr asString.
			^ p].
	((in isNil or: [lastProxy isNil]) or: [in isPipe not])
		ifTrue:
			[input := in]
		ifFalse:
			["Input from a command pipeline"
			(in isKindOf: InternalPipe)
				ifTrue:
					["The input stream is not an external OS pipe. Need to create one,
					and move the contents of the in stream into the new OSPipe prior
					to starting the external OS process."
					newInputPipe := PipeJunction externalPipeClass blockingPipe.
					lastProxy replaceOutputStreamWith: newInputPipe writer.
					input := newInputPipe reader]
				ifFalse:
					[input := in reader]].
	errorPipelineStream := lastProxy ifNotNil: [lastProxy errorPipeForNextProxy].
	proxy := PipeableOSProcess
		commandNoEvaluate: aCommandString
		environment: self environment
		workingDir: self workingDirectory
		input: input
		output: out
		error: err
		errorPipelineStream: errorPipelineStream
		shellSyntax: self shellSyntax.
	(proxy isNil and: [newInputPipe notNil])
		ifTrue: [newInputPipe closeReader]. "replacement pipe will not be read, so close its output"
	^ proxy
