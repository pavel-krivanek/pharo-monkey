testing-scripts
testCommandOnFailure02

	"(CommandShellTestCase selector: #testCommandOnFailure02) run"

	| openFileCount result |
	openFileCount := self numberOfOpenFiles.
	result := shell command: 'ls' onFailureDo: ['the command failed'].
	self should: [result isKindOf: OrderedCollection].
	self should: [self isNumberOfOpenFiles: openFileCount]
