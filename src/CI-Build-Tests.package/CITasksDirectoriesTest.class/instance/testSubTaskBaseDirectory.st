tests
testSubTaskBaseDirectory

	| task subtask |
	task := process addSubtask: (CITask named: 'test').
	subtask := task addSubtask: (CITask named: 'subtest').
	
	self assert: subtask baseDirectory equals: subtask taskDirectory