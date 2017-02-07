bash-file-management
pushNewFile: aString 
	
	| file |
	file := CIBash named: aString.
	fileStack push: file.
	^ file