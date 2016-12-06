initialize - release
closePipes
	"Replace the output and error pipe streams with internal pipes, and close
	all input and output pipes."

	| output out err p |
	self keepInitialStdOutOpen
		ifTrue:
			["The pipe stream will be closed by the next process in the command pipeline"
			(p := pipeFromOutput) ifNotNil: [p triggerDataReady]]
		ifFalse:
			[(output := self pipeFromOutput)
				ifNotNil:
					[accessProtect critical:
						[self pipeFromOutput: InternalPipe new.
						out := output upToEnd.
						out isEmpty ifFalse:
							[self pipeFromOutput nextPutAll: out.
							self triggerOutputDataReady].
						self pipeFromOutput closeWriter.
						output removeDependent: self; close]]].
	(pipeFromError) ifNotNil:
		[accessProtect critical:
			[err := pipeFromError upToEnd.
			err isEmpty ifFalse:
				[self addToErrorPipeline: err.
				self triggerEvent: #errorDataReady].
			pipeFromError removeDependent: self; close]].
	self keepInitialStdErrOpen ifTrue: [self processProxy initialStdErr close].
	self pipeToInput ifNotNil: [pipeToInput close]
