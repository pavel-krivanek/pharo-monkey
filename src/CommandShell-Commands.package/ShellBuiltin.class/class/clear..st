instance creation
clear: commandShell
	"Define command to clear the terminal display screen. Answer a string or an invalid
	command message."

	^ self name: 'clear'
		help: #clearHelp
		procedure: #clearCommand:shell:input:output:error:arguments:
		needsPrompt: true
