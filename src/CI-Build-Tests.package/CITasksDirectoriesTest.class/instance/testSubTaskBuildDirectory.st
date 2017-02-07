tests
testSubTaskBuildDirectory

	| task subtask |
	task := process addSubtask: (CITask named: 'test').
	subtask := task addSubtask: (CITask named: 'subtest').
	
	self assert: subtask buildDirectory equals: subtask taskDirectory / 'build'