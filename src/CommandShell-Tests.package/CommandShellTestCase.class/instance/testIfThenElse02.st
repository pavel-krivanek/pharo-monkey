testing-scripts
testIfThenElse02

	"(CommandShellTestCase selector: #testIfThenElse02) run"

	| openFileCount result |
	openFileCount := self numberOfOpenFiles.
	result := shell
		if: 'ls NO/SUCH/FILE'
		then: ['the command succeeded']
		else: ['the command failed'].
	self should: ['the command failed' = result].
	self should: [self isNumberOfOpenFiles: openFileCount]
