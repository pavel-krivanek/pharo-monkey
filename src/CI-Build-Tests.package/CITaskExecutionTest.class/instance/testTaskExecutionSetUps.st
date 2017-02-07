tests
testTaskExecutionSetUps

	| executor |
	executor := CIMockExecutor new.
	process executeWith: executor.
	
	self assert: executor isSetUp.