tests
testTaskParent

	| task |
	task := process addSubtask: (CITask named: 'test').
	
	self assert: task parent equals: process