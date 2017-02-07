executing
checkPreviousStatus
	
	self currentBashFile
		addStatement: 'if [ -f "${__dir}/status" ]; then
	STATUS=$(head -n 1 "${__dir}/status");
	if [ ${STATUS} == "SUCCESS" ]; then
		echo "Skipping Task ${__task_name}".
		exit 0;
	fi
fi';
		newLine.

	^ CINonExecutedState new