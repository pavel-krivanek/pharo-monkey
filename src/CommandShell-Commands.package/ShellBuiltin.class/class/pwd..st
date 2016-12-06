instance creation
pwd: commandShell
	"Define command to answer the current working directory (a string) or an
	invalid command message."

	^ self name: 'pwd'
		help: #pwdHelp
		procedure: #pwdCommand:shell:input:output:error:arguments:
		needsPrompt: true
