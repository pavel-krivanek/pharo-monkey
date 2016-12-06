initialize - release
closePipeInputs
	"Close all pipe endpoints not used after process termination."

	pipeToInput
		ifNotNil: [pipeToInput close].
	pipeFromOutput ifNotNil:
		[pipeFromOutput isPipe
			ifTrue: [pipeFromOutput closeWriter]
			ifFalse: [pipeFromOutput close]]
