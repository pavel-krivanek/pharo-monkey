testing - string tokenizer
testStringTokensFrom11

	"(ShellSyntaxTestCase selector: #testStringTokensFrom11) run"

	| t |
	t := shellSyntax stringTokensFrom: 'this'' is ''	a	test'.
	self should: [t last isNil].
	self should: [t first size == 3].
	self should: [t first last = 'test'].
	self should: [t first first = 'this is '].
