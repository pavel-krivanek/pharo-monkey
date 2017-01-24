accessing
buildOperations
	
	^ self steps collect: [ :step | CICallCIStep step: step ]