instance creation
cd: commandShell
	"Define command to set the current working directory. Answer an empty string
	or #invalidCommand."

	^ self name: 'cd'
		help: #cdHelp
		procedure: #cdCommand:shell:input:output:error:arguments:
		needsPrompt: true
