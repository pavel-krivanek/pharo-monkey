executing
tearDown
	
	isTravis ifTrue: [ 
		"Remove the build after it's done".
		self deleteFile: self currentTask buildDirectory fullName ]