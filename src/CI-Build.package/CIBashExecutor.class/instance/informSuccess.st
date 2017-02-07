executing
informSuccess
	
	self currentBashFile
		newLine;
		addStatement: 'echo "SUCCESS" > "${__dir}/status"'