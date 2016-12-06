testing-scripts
testCommandOnFailure03

	"(CommandShellTestCase selector: #testCommandOnFailure03) run"

	| openFileCount result |
	openFileCount := self numberOfOpenFiles.
	result := shell command: 'ls NO/SUCH/FILE'
				onFailureDo: [:p | 'the command failed ', p printString].
	self should: ['the command failed*' match: result].
	self should: [self isNumberOfOpenFiles: openFileCount]
