instance creation
inspect: commandShell
	"Define command to open a Smalltalk inspector on the contents of stdin, or the
	file(s) named on the command line."

	^ self name: 'inspect'
		help: #inspectHelp
		procedure: #inspectCommand:shell:input:output:error:arguments:
		needsPrompt: true
