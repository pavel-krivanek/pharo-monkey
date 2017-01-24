tests
testOneStepsOutputIsNextStepsInput

	process := CIProcess new.
	process addStep: ((CIStep named: 'generate')
		addOperation: (CIEcho new
			text: 'text';
			toFileNamed: 'output.txt');
		output: { 'output.txt' }).
	process addStep: (CIStep named: 'testStep').
	
	process execute.
	
	self assert: (process steps second buildDirectory / 'output.txt') exists. 