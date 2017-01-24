as yet unclassified
exampleEval

	^ (CIStep named: 'EvalExample')
		addOperation: (CICallPharo eval: '2+2');
		yourself