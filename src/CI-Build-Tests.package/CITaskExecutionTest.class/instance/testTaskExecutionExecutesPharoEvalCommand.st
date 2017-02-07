tests-steps
testTaskExecutionExecutesPharoEvalCommand

	| executor |
	process addStep: (CIPharoStep eval: '2+2').
	
	executor := CIMockExecutor new.
	process executeWith: executor.
	
	self assert: (executor isCallingPharo: 'eval' arguments: {'2+2'}).