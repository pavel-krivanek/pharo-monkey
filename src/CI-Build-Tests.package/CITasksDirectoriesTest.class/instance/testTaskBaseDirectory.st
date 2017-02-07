tests
testTaskBaseDirectory

	| task |
	task := process addSubtask: (CITask named: 'test').
	
	self assert: task baseDirectory equals: task taskDirectory