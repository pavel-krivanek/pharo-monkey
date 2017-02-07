as yet unclassified
exampleEval

	^ (CITask named: 'EvalExample')
		addOperation: (CIPharoStep eval: '2+2');
		yourself