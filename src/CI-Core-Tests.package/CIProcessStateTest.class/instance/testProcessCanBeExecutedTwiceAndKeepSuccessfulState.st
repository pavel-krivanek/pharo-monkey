tests
testProcessCanBeExecutedTwiceAndKeepSuccessfulState

	| state |
	process := CIProcess new.

	process execute.
	state := process state.
	
	process execute.
	self assert: state equals: process state.