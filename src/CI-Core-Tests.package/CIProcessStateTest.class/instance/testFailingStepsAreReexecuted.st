tests
testFailingStepsAreReexecuted

	| first second counter |
	process := CIProcess new.
	process addStep: (first := CIStep named: 'first step').
	first addOperation: (CITestCounterOperation new).
	
	process addStep: (second := CIStep named: 'failing step').
	second addOperation: (counter := CITestCounterOperation new).
	second addOperation: (CIErrorOperation new).
	
	5 timesRepeat: [process execute].
	
	self assert: counter count equals: 5.