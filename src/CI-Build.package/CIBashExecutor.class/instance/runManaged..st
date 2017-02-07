bash-file-management
runManaged: aCommand
	
	self currentBashFile addStatement: ('run_command "{1}"' format: { aCommand }).