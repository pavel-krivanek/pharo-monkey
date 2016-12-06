testing - string tokenizer
testStringTokensFrom07

	"(ShellSyntaxTestCase selector: #testStringTokensFrom07) run"

	| t |
	t := shellSyntax stringTokensFrom: 'this is 	a	te\st'.
	self should: [t last isNil].
	self should: [t first size == 4].
	self should: [t first last = 'test'].
	self should: [t first first = 'this'].
