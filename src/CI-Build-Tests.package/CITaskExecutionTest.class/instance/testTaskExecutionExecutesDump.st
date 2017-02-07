tests-steps
testTaskExecutionExecutesDump

	| executor |
	process addStep: (CIDumpStep files: { 'dumped' }).
	
	executor := CIMockExecutor new.
	process executeWith: executor.
	
	self assert: (executor isDumping: CIUtils pwd / 'dumped')