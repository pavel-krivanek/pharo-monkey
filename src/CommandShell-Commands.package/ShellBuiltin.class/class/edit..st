instance creation
edit: commandShell
	"Define command to open an editor on each of the named files."

	^ self name: 'edit'
		help: #editHelp
		procedure: #editCommand:shell:input:output:error:arguments:
		needsPrompt: true
