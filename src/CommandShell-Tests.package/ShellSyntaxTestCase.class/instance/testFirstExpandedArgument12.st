testing - first expanded path
testFirstExpandedArgument12

	"(ShellSyntaxTestCase selector: #testFirstExpandedArgument12) run"

	|  arg |
	self unix ifTrue:
		[arg := shellSyntax firstExpandedArgument: '../bin' inDirectoryPath: '/usr/bin'.
		self shouldnt: [arg isEmpty].
		self should: [arg = '/usr/bin']]
