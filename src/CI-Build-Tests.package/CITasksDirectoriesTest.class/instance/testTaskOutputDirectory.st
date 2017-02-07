tests
testTaskOutputDirectory

	| task |
	task := process addSubtask: (CITask named: 'test').
	
	self assert: task outputDirectory equals: task taskDirectory / 'output'