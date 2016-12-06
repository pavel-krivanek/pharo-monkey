testing-scripts
testScriptOnFailure03

	"(CommandShellTestCase selector: #testScriptOnFailure03) run"

	| openFileCount result |
	openFileCount := self numberOfOpenFiles.
	result := shell
		script: 'who
				help
				ls -l NOSUCHFILE
				help'
		onFailureDo: ['the pipeline collection failed'].
	self should: ['the pipeline collection failed' = result].
	self should: [self isNumberOfOpenFiles: openFileCount]
