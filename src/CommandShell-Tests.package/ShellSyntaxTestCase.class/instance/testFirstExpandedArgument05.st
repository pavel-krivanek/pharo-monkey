testing - first expanded path
testFirstExpandedArgument05

	"(ShellSyntaxTestCase selector: #testFirstExpandedArgument05) run"

	|  arg |
	self unix ifTrue:
		[arg := shellSyntax firstExpandedArgument: '../bin/vi' inDirectoryPath: '/usr/bin'.
		self shouldnt: [arg isEmpty].
		self should: [arg = '/usr/bin/vi']]
