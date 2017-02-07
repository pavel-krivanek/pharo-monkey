adding
addSubtask: aCITask 
	
	tasks add: aCITask.
	aCITask process: self.
	^ aCITask