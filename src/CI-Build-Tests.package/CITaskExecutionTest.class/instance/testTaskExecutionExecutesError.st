tests-steps
testTaskExecutionExecutesError

	| executor |
	process addStep: (CIFailStep code: 17).
	
	executor := CIMockExecutor new.
	process executeWith: executor.
	
	self assert: (executor throwsError: 17)