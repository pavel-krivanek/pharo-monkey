event handling
handleRunstateChange

	| lastProxy |
	(lastProxy := self last)
		ifNotNil: [lastProxy isComplete
					ifTrue: [self completionSemaphore signal]]