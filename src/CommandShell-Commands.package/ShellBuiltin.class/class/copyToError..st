instance creation
copyToError: commandShell
	"Define command to copy the contents of (argArray at: 1) or stdin onto
	stderr. This command exists only for purposes of testing stdin and pipelines
	for PipeableEvaluator proxies."

	^ self name: 'copyToError'
		help: nil
		procedure: #copyToErrorCommand:shell:input:output:error:arguments:
		needsPrompt: true
