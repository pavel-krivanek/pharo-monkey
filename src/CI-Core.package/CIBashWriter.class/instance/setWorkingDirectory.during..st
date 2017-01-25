high-level
setWorkingDirectory: aDirectory during: aBlock

	self writeLine: 'PREVIOUS_PWD="`pwd`"'.
	self writeLine: 'STEP_DIRECTORY="{1}"' format: { aDirectory fullName }.
	self writeLine: 'cd "${STEP_DIRECTORY}"'.
	
	aBlock value.

	self writeLine: 'cd "${PREVIOUS_PWD}"'.
	self newLine.