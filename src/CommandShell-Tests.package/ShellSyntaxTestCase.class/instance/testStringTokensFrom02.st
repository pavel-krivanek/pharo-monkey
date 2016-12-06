testing - string tokenizer
testStringTokensFrom02

	"(ShellSyntaxTestCase selector: #testStringTokensFrom02) run"

	| t |
	t := shellSyntax stringTokensFrom: 'this ''is 	a''	test'.
	self should: [t last isNil].
	self should: [t first size == 3].
	self should: [t first last = 'test'].
	self should: [t first first = 'this'].
