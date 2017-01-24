running
testProcessBuildAllShouldCreateStepBuildDirectory

	| step |
	process := CIProcess new.
	process addStep: (step := (CIStep named: 'error') addOperation: CIErrorOperation new).
	
	process build.
	self assert: step buildDirectory exists.