tests
testTaskBuildDirectory

	| task |
	task := process addSubtask: (CITask named: 'test').
	
	self assert: task buildDirectory equals: task taskDirectory / 'build'