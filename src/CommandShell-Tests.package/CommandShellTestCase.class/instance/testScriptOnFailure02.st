testing-scripts
testScriptOnFailure02

	"(CommandShellTestCase selector: #testScriptOnFailure02) run"

	| openFileCount result |
	openFileCount := self numberOfOpenFiles.
	result := shell
		script: 'who
				help
				ls
				help'
		onFailureDo: [:p | 'the pipeline collection that failed was ', p printString].
	self should: [result isKindOf: OrderedCollection].
	self should: [self isNumberOfOpenFiles: openFileCount]
