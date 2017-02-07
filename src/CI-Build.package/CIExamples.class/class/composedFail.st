examples
composedFail

	^ (CITask named: 'composedFail')
		addSubtask: self fail;
		yourself