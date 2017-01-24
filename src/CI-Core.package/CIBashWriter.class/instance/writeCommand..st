writing
writeCommand: aCommandString

	self writeLine: 'run_command "{1}"' format: { aCommandString }