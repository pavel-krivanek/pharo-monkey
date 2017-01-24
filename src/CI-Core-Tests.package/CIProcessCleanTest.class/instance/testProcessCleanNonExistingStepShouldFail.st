running
testProcessCleanNonExistingStepShouldFail

	process := CIProcess new.
	process execute.
	
	self should: [ process cleanStepNamed: 'step1' ] raise: CIStepNotFoundError