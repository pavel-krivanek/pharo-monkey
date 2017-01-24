tests
testStepSetupCreatesStepDirectory

	| step |
	step := CIStep named: 'testStep'.
	step setUp.
	
	self assert: step buildDirectory exists.