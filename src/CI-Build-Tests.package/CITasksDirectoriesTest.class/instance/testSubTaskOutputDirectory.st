tests
testSubTaskOutputDirectory

	| task subtask |
	task := process addSubtask: (CITask named: 'test').
	subtask := task addSubtask: (CITask named: 'subtest').
	
	self assert: subtask outputDirectory equals: subtask taskDirectory / 'output'