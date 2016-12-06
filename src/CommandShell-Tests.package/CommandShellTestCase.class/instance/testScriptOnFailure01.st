testing-scripts
testScriptOnFailure01

	"(CommandShellTestCase selector: #testScriptOnFailure01) run"

	| openFileCount result |
	openFileCount := self numberOfOpenFiles.
	result := shell
		script: 'who
				help
				ls -l NOSUCHFILE
				help'
		onFailureDo: [:p | 'the pipeline collection that failed was ', p printString].
	self should: ['the pipeline collection *' match: result].
	self should: [self isNumberOfOpenFiles: openFileCount]
