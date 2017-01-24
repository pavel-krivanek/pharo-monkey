tests
testEachStepKnowsNextStep

	| first second |
	process := CIProcess new.
	process addStep: (first := CIStep named: 'first step').
	process addStep: (second := CIStep named: 'second step').
	
	self assert: first nextStep equals: second.