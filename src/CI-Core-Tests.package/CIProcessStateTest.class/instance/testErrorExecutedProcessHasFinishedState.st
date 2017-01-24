tests
testErrorExecutedProcessHasFinishedState

	process := CIProcess new.
	process addStep: ((CIStep named: 'error') addOperation: CIErrorOperation new).
	process execute.
	self assert: process state isError.
	self assert: process state isFinished.