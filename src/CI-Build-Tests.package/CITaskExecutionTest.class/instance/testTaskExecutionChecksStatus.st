tests
testTaskExecutionChecksStatus

	| executor |
	executor := CIMockExecutor new.
	process executeWith: executor.
	
	self assert: executor checksStatus.