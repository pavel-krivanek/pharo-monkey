tests-steps
testTaskExecutionExecutesShellCommand

	| executor |
	process addStep: (CIShellStep command: 'echo "test"').
	
	executor := CIMockExecutor new.
	process executeWith: executor.
	
	self assert: (executor isCallingBash: 'echo "test"').