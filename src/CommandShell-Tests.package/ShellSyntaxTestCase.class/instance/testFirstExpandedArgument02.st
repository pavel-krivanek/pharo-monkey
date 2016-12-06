testing - first expanded path
testFirstExpandedArgument02

	"(ShellSyntaxTestCase selector: #testFirstExpandedArgument02) run"

	|  arg |
	arg := shellSyntax firstExpandedArgument: 'm?*l' inDirectoryPath: '/no/such/directory'.
	self shouldnt: [arg isEmpty].
	self should: [arg = '/no/such/directory/m?*l']
