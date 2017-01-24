visiting
visitStep: aCIStep 
	
	currentStep := aCIStep.
	aCIStep buildDirectory ensureCreateDirectory.

	self writeShebang.
	self writeLine: 'unset CDPATH'.
	self newLine.
	
	self environmentVariables do: [ :variable | 
		self defineEnvironmentVariable: variable ].
	self newLine.
	
	self writeLine: 'if [ -f "${SCRIPT_DIRECTORY}/status" ]; then
	STATUS=$(head -n 1 "${SCRIPT_DIRECTORY}/status");
	if [ ${STATUS} == "SUCCESS" ]; then exit 0; fi
fi'.
	self newLine.
	
	self writeRunCommandFunction.
	self newLine.
	
	aCIStep buildOperations do: [ :op | op exportUsing: self ].
	
	self
		newLine;
		writeLine: 'echo "SUCCESS" > "${SCRIPT_DIRECTORY}/status"'.
	
	self endWriting.