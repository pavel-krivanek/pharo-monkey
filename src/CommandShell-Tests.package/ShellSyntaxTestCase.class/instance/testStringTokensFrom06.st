testing - string tokenizer
testStringTokensFrom06

	"(ShellSyntaxTestCase selector: #testStringTokensFrom06) run"

	| t |
	t := shellSyntax stringTokensFrom: ' this ''is 	a	test '.
	self should: [t last = 'unbalanced quotes'].
	self should: [t first size == 2].
	self should: [t first last = 'is 	a	test '].
	self should: [t first first = 'this'].
