activation
activate

	| executor |
	executor := CIBashExecutor new.
	executor beTravis: (self hasOption: 'travis').
	executor basicExecuteSubtask: self mainTask.
	executor export.
	
	self exitSuccess.