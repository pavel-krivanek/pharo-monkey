tests
testSucessfulStepsAreNotReexecuted

	| first second counter |
	process := CIProcess new.
	process addStep: (first := CIStep named: 'first step').
	first addOperation: (counter := CITestCounterOperation new).
	
	process addStep: (second := CIStep named: 'failing step').
	second addOperation: (CITestCounterOperation new).
	second addOperation: (CIErrorOperation new).
	
	5 timesRepeat: [process execute].
	
	self assert: counter count equals: 1.