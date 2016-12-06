instance creation
snapshot: commandShell
	"Define command to save the Squeak image."

	^ self name: 'snapshot'
		help: #snapshotHelp
		procedure: #snapshotCommand:shell:input:output:error:arguments:
		needsPrompt: true
