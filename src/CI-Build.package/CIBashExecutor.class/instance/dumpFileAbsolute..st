executing
dumpFileAbsolute: aFileReference
 
	self
		copy: aFileReference
		to: self currentTask buildDirectory
		recursive: true