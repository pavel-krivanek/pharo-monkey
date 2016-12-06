instance creation
sls: commandShell
	"Define command to for a simple directory contents lister"

	^ self name: 'sls'
		help: #slsHelp
		procedure: #slsCommand:shell:input:output:error:arguments:
		needsPrompt: true
