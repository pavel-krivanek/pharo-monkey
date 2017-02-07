executing
executeSubtask: aCITask
	
	self basicExecuteSubtask: aCITask.
	self callTask: aCITask.