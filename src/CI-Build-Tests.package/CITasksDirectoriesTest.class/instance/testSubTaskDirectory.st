tests
testSubTaskDirectory

	| task subtask |
	task := process addSubtask: (CITask named: 'test').
	subtask := task addSubtask: (CITask named: 'subtest').

	self assert: subtask taskDirectory equals: task tasksDirectory / subtask trimmedName