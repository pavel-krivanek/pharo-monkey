tests
testTaskExecutionExecutesSubtask

	| executor task |
	task := process addSubtask: (CITask named: 'test').	
	
	executor := CIMockExecutor new.
	process executeWith: executor.
	
	self assert: (executor hasExecuted: task).