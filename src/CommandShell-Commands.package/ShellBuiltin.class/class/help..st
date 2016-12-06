instance creation
help: commandShell
	"Define command to display help messages."

	^ self name: 'help'
		help: #helpHelp
		procedure: #helpCommand:shell:input:output:error:arguments:
		needsPrompt: true
