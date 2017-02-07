tests
testTaskExecutionInformsSuccessAtEnd

	| executor |
	executor := CIMockExecutor new.
	process executeWith: executor.
	
	self assert: executor informedSuccessAsLastOperation.