testing - string tokenizer
testStringTokensFrom04

	"(ShellSyntaxTestCase selector: #testStringTokensFrom04) run"

	| t |
	t := shellSyntax stringTokensFrom: ' this ''is 	a''	test '.
	self should: [t last isNil].
	self should: [t first size == 3].
	self should: [t first last = 'test'].
	self should: [t first first = 'this'].
