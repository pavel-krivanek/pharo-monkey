instance creation
fc: commandShell
	"Define 'fix command' command. If argArray is emply, answer the last
	command in the history list. If there is one argument, interpret it as an
	integer index into the history list. Otherwise answer an invalid command
	message."

	^ self name: 'fc'
		help: #fcHelp
		procedure: #fcCommand:shell:input:output:error:arguments:
		needsPrompt: false
