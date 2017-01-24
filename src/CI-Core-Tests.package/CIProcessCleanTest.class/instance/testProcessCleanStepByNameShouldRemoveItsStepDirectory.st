running
testProcessCleanStepByNameShouldRemoveItsStepDirectory

	| step1 step2 |
	process := CIProcess new.
	process addStep: (step1 := (CIStep named: 'step1') addOperation: CIErrorOperation new).
	process addStep: (step2 := (CIStep named: 'step2') addOperation: CIErrorOperation new).
	process execute.
	
	process cleanStepNamed: 'step1'.
	self assert: step1 buildDirectory exists not.