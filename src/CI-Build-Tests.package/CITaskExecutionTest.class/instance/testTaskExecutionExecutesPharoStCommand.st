tests-steps
testTaskExecutionExecutesPharoStCommand

	| executor |
	process addStep: (CIPharoStep st: 'MyFile.st').
	
	executor := CIMockExecutor new.
	process executeWith: executor.
	
	self assert: (executor isCallingPharo: 'st' arguments: {'MyFile.st' . '--save' . '--quit'}).