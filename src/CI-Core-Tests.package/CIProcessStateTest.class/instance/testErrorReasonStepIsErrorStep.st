tests
testErrorReasonStepIsErrorStep

	| errorStep |
	process := CIProcess new.
	process addStep: (errorStep := (CIStep named: 'error') addOperation: CIErrorOperation new).
	process execute.
	self assert: process state reasonStep equals: errorStep