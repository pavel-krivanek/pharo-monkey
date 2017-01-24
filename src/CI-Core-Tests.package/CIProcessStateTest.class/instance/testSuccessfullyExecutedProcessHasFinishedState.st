tests
testSuccessfullyExecutedProcessHasFinishedState

	process := CIProcess new.
	process execute.
	self assert: process state isSuccess.
	self assert: process state isFinished.