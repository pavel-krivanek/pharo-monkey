running
testProcessCleanStepShouldNotRemoveBaseDirectory

	| step1 step2 |
	process := CIProcess new.
	process addStep: (step1 := (CIStep named: 'step1') addOperation: CIErrorOperation new).
	process addStep: (step2 := (CIStep named: 'step2') addOperation: CIErrorOperation new).
	process execute.
	
	process cleanStep: step1.
	self assert: process baseDirectory exists.