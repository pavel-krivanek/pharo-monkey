instance creation
type: commandShell
	"Define command to answer how each name would be interpreted if used as a
	command name."

	^ self name: 'type'
		help: #typeHelp
		procedure: #typeCommand:shell:input:output:error:arguments:
		needsPrompt: true
