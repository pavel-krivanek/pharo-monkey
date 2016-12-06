setting run state
complete
	"Evaluation has been completed. Perform some cleanup and notify
	interested parties."

	self closePipeInputs.
	self runState: #complete.
	self errorHasBeenRedirected
		ifTrue: [self closeErrorPipeline]