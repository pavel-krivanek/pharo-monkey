tests
testTaskDirectory

	| task |
	task := process addSubtask: (CITask named: 'test').
	self assert: task taskDirectory equals: process tasksDirectory / task trimmedName