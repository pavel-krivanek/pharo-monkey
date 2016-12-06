testing-scripts
testIfThenElse01

	"(CommandShellTestCase selector: #testIfThenElse01) run"

	| openFileCount result |
	openFileCount := self numberOfOpenFiles.
	result := shell
		if: 'who'
		then: ['the command succeeded']
		else: ['the command failed'].
	self should: ['the command succeeded' = result].
	self should: [self isNumberOfOpenFiles: openFileCount]
