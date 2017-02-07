exporting
export: aCITask 
	
	| executor |
	executor := self new.
	aCITask beRoot.
	executor basicExecuteSubtask: aCITask.
	executor export.