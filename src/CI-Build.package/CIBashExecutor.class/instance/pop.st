bash-file-management
pop
	
	| file |
	file := fileStack pop.
	shellFiles add: file.
	^ file