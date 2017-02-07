bash-file-management
pushTask: aCITask 
	
	| file |
	file := self pushNewFile: aCITask baseDirectory / self buildFileName.
	taskFilesDictionary at: aCITask put: file.