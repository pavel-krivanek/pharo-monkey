initialization
setUp

	super setUp.
	executor := CIBashExecutor new.	
	process := CITask new.
	executor pushTask: process.