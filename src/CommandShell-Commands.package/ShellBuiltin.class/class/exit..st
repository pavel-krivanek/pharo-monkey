instance creation
exit: commandShell
	"Define command to exit the shell window. Answer a string or an invalid
	command message."

	^ self name: 'exit'
		help: #exitHelp
		procedure: #exitCommand:shell:input:output:error:arguments:
		needsPrompt: true
