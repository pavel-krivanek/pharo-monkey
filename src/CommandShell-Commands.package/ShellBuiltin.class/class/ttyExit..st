instance creation
ttyExit: commandShell
	"Define command to exit the Squeak shell and quit Squeak without saving the image."

	^ self name: 'exit'
		help: #ttyExitHelp
		procedure: #ttyExitCommand:shell:input:output:error:arguments:
		needsPrompt: true
