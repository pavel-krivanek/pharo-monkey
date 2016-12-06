testing - first expanded path
testFirstExpandedArgument06

	"(ShellSyntaxTestCase selector: #testFirstExpandedArgument06) run"

	|  arg |
	arg := shellSyntax firstExpandedArgument: nil inDirectoryPath: '/usr/bin'.
	self should: [arg = '']
