examples
fail

	^ (CITask named: 'fail')
		addStep: (CIFailStep code: 1);
		yourself