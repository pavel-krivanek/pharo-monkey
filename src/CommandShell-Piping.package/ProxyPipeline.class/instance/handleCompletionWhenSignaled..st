event handling
handleCompletionWhenSignaled: aSemaphore
	"Answer a process that will complete processing the the last proxy has
	signaled its completion."

	| lastProxy proc |
	proc := [aSemaphore wait.
		self waitForAllToComplete.
		(lastProxy := self last)
			ifNotNil: [lastProxy closeErrorPipeline.
					self triggerEvent: #complete]] newProcess.
	^ proc resume