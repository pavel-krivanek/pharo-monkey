running
testProcessCleanAllShouldRemoveBaseDirectory

	process := CIProcess new.
	process addStep: ((CIStep named: 'error') addOperation: CIErrorOperation new).
	process execute.
	
	process clean.
	self assert: process baseDirectory exists not.