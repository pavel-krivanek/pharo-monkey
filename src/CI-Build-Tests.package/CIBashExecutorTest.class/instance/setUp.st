initialization
setUp

	super setUp.
	executor := CIBashExecutor new.	
	process := CITask newRoot.
	executor pushTask: process.