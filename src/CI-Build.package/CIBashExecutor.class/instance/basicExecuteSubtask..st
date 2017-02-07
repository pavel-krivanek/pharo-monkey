bash-file-management
basicExecuteSubtask: aCITask
	
	self pushTask: aCITask.
	aCITask executeWith: self.
	self pop.