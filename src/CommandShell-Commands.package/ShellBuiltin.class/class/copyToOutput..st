instance creation
copyToOutput: commandShell
	"Define command to  copy the contents of (argArray at: 1) or stdin onto
	stdout. This command exists only for purposes of testing stdin and pipelines
	for PipeableEvaluator proxies."

	^ self name: 'copyToOutput'
		help: nil
		procedure: #copyToOutputCommand:shell:input:output:error:arguments:
		needsPrompt: true
