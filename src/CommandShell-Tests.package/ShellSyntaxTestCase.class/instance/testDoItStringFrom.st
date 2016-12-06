testing - command parsing
testDoItStringFrom

	"(ShellSyntaxTestCase selector: #testDoItStringFrom) run"

	self should:
		(shellSyntax doItStringFrom: 'this should answer a string!')
			= 'this should answer a string'.
	self should:
		(shellSyntax doItStringFrom: 'this should answer a string!   ')
			= 'this should answer a string'.
	self should:
		(shellSyntax doItStringFrom: 'this should answer nil') isNil
