output
copyOutputOperation
	
	^ CICopy
		filesToCopy: output
		destination: self nextStep buildDirectory