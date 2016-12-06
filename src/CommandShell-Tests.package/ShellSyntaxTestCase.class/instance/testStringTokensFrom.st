testing - command parsing
testStringTokensFrom

	"(ShellSyntaxTestCase selector: #testStringTokensFrom) debug"

	| r |
	r := shellSyntax stringTokensFrom: 'this is 	a	test of 	 the string tokenizer'.
	self should: r second isNil.
	self should: r first size = 8.
	self should: r first last = 'tokenizer'.

	r := shellSyntax stringTokensFrom: 'this is 	a	test of 	 ''the string'' tokenizer'"
	self should: r second isNil.
	self should: r first size = 7.
	self should: r first last = 'tokenizer'.
	self should: r first sixth = 'the tokenizer'.

	r := shellSyntax stringTokensFrom: 'this is 	a	test of'' the string'' tokenizer'".
	self should: r second isNil.
	self should: r first size = 7.
	self should: r first sixth = 'the string'.

	r := shellSyntax stringTokensFrom: 'this is 	a	test of ''the string ''tokenizer'.
	self should: r second isNil.
	self should: r first size = 6.
	self should: r first sixth = 'the string tokenizer'.

	r := shellSyntax stringTokensFrom: 'this is 	a	test of 	 \''the string\'' tokenizer'.
	self should: r second isNil.
	self should: r first size = 8.
	self should: r first sixth = '''the'.
	self should: r first seventh = 'string'''.
	self should: r first eighth = 'tokenizer'.

	r := shellSyntax stringTokensFrom: '''this is'' 	a	test'.
	self should: r second isNil.
	self should: r first size = 3.
	self should: r first first = 'this is'.
	self should: r first second = 'a'.
	self should: r first third = 'test'.

	r := shellSyntax stringTokensFrom: 'this is ''a	test'''.
	self should: r second isNil.
	self should: r first size = 3.
	self should: r first first = 'this'.
	self should: r first second = 'is'.
	self should: r first third = 'a	test'.
	self should: r first third second = Character tab.

	r := shellSyntax stringTokensFrom: '''this is'' 	a	test of 	 \''the string\'' tokenizer '.
	self should: r second isNil.
	self should: r first size = 7.
	self should: r first first = 'this is'.
	self should: r first second = 'a'.
	self should: r first third = 'test'.
	self should: r first fourth = 'of'.
	self should: r first fifth = '''the'.
	self should: r first sixth = 'string'''.
	self should: r first seventh = 'tokenizer'.


	r := shellSyntax stringTokensFrom: 'this is ''a	test'.
	self should: r second = 'unbalanced quotes'.
	self should: r first size = 3.
	self should: r first first = 'this'.
	self should: r first second = 'is'.
	self should: r first third = 'a	test'.
	self should: r first third second = Character tab
