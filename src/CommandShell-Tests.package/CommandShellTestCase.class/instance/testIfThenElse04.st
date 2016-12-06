testing-scripts
testIfThenElse04

	"(CommandShellTestCase selector: #testIfThenElse04) run"

	| openFileCount result |
	openFileCount := self numberOfOpenFiles.
	result := shell
		if: 'who'
		then: [:p |
			self should: [p isKindOf: OrderedCollection].
			'the command succeeded', p printString]
		else: [:p |
			self should: [p isKindOf: OrderedCollection].
			'the command failed ', p printString].
	self should: ['the command succeeded*' match: result].
	self should: [self isNumberOfOpenFiles: openFileCount]
