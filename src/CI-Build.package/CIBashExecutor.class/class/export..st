exporting
export: aCITask 
	
	| executor |
	executor := self new.
	executor basicExecuteSubtask: aCITask.
	executor export.