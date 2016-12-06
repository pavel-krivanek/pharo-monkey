testing - string tokenizer
testStringTokensFrom05

	"(ShellSyntaxTestCase selector: #testStringTokensFrom05) run"

	| t |
	t := shellSyntax stringTokensFrom: ' this \''is 	a\''	test '.
	self should: [t last isNil].
	self should: [t first size == 4].
	self should: [t first last = 'test'].
	self should: [t first second = '''is'].
	self should: [t first third = 'a'''].
	self should: [t first first = 'this'].
