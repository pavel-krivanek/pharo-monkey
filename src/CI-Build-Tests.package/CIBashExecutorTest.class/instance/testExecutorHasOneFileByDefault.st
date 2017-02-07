initialization
testExecutorHasOneFileByDefault

	executor stop.
	self assert: executor shellFiles size equals: 1.