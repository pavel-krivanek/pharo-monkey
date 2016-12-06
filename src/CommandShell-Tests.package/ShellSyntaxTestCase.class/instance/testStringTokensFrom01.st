testing - string tokenizer
testStringTokensFrom01

	"(ShellSyntaxTestCase selector: #testStringTokensFrom01) run"

	| t |
	t := shellSyntax stringTokensFrom: 'this is 	a	test'.
	self should: [t last isNil].
	self should: [t first size == 4].
	self should: [t first last = 'test'].
	self should: [t first first = 'this'].
