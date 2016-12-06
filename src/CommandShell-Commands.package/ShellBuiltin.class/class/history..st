instance creation
history: commandShell
	"Define command to display the command history list."

	^ self name: 'history'
		help: #historyHelp
		procedure: #historyCommand:shell:input:output:error:arguments:
		needsPrompt: true
