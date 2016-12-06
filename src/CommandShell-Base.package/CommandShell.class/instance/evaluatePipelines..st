evaluation
evaluatePipelines: aPipelineCollection
	"Evaluate the process proxies in aPipelineCollection, and process their output and error
	streams. Answer aPipelineCollection."

	| lastForegroundPipeline completionSemaphore |
	lastForegroundPipeline := nil.
	aPipelineCollection isEmpty ifFalse:
		[lastForegroundPipeline := aPipelineCollection reversed
			detect: [:p | p background not]
			ifNone: [].
		lastForegroundPipeline ifNotNil: [self registerPromptEventFor: lastForegroundPipeline].
		aPipelineCollection do: [:pipeline |
			completionSemaphore := Semaphore new.
			pipeline background
				ifTrue: [completionSemaphore signal "no wait"]
				ifFalse: [pipeline when: #complete send: #signal to: completionSemaphore].
			self evaluatePipeline: pipeline.
			completionSemaphore wait]].
	lastForegroundPipeline ifNil: [self notifyPrompt].
	self resetSafeToExitFlag.
	^ aPipelineCollection
