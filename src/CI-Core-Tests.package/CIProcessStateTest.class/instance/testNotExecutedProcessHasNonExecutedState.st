tests
testNotExecutedProcessHasNonExecutedState

	process := CIProcess new.
	self assert: process state isNotExecuted.