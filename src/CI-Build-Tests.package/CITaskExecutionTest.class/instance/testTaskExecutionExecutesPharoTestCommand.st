tests-steps
testTaskExecutionExecutesPharoTestCommand

	| executor |
	process addStep: (CIPharoStep test: 'MyPackage').
	
	executor := CIMockExecutor new.
	process executeWith: executor.
	
	self assert: (executor isCallingPharo: 'test' arguments: {'MyPackage'}).