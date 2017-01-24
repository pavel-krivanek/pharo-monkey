running
testProcessBuildAllShouldCreateBaseDirectory

	process := CIProcess new.
	process addStep: ((CIStep named: 'error') addOperation: CIErrorOperation new).
	
	process build.
	self assert: process baseDirectory exists.