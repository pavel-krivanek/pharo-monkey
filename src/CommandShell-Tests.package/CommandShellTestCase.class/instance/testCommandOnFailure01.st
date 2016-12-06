testing-scripts
testCommandOnFailure01

	"(CommandShellTestCase selector: #testCommandOnFailure01) run"

	| openFileCount result |
	openFileCount := self numberOfOpenFiles.
	result := shell command: 'ls NO/SUCH/FILE' onFailureDo: ['the command failed'].
	self should: [result = 'the command failed'].
	self should: [self isNumberOfOpenFiles: openFileCount]
