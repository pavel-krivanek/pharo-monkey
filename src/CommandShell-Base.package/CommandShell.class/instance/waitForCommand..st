evaluation
waitForCommand: aCommandString
	"Evaluate aCommandString in a separate Process, and signal completionSemaphore
	when complete. Answer a collection of evaluated pipelines, or nil if nothing was done."

	| sema pipelines lastPipeline |
	self changed: aCommandString.
	pipelines := self evaluateOrMakePipelinesFrom: aCommandString.
	pipelines isEmpty ifFalse:
		[lastPipeline := pipelines last.
		lastPipeline isComplete ifFalse:
			[sema := Semaphore new.
			lastPipeline when: #complete
				send: #signal
				to: sema.
			[self evaluatePipelines: pipelines] forkAt: Processor userBackgroundPriority.
			lastPipeline isComplete ifFalse: [sema wait].
			self waitUntilPipesAreEmpty: lastPipeline]].
	^ pipelines
