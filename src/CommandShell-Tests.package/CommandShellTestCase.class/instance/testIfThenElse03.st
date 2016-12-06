testing-scripts
testIfThenElse03

	"(CommandShellTestCase selector: #testIfThenElse03) run"

	| openFileCount result |
	openFileCount := self numberOfOpenFiles.
	result := shell
		if: 'who
			ls NO/SUCH/FILE
			who'
		then: [:p |
			self should: [p isKindOf: OrderedCollection].
			self should: [p first succeeded].
			self shouldnt: [p second succeeded].
			self should: [p third succeeded].
			'the command succeeded', p printString]
		else: [:p |
			self should: [p isKindOf: OrderedCollection].
			'the command failed ', p printString].
	self should: ['the command failed*' match: result].
	self should: [self isNumberOfOpenFiles: openFileCount]
