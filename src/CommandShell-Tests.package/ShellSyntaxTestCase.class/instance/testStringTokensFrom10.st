testing - string tokenizer
testStringTokensFrom10

	"(ShellSyntaxTestCase selector: #testStringTokensFrom10) run"

	| t |
	t := shellSyntax stringTokensFrom: 'this is 	''a	test'''.
	self should: [t last isNil].
	self should: [t first size == 3].
	self should: [t first last = 'a	test'].
	self should: [t first first = 'this'].
