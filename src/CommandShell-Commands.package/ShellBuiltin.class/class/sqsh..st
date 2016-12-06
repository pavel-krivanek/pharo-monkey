instance creation
sqsh: commandShell
	"Define command to open a new shell window."

	^ self name: 'sqsh'
		help: #sqshHelp
		procedure: #sqshCommand:shell:input:output:error:arguments:
		needsPrompt: true
