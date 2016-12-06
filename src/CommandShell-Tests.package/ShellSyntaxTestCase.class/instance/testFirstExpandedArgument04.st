testing - first expanded path
testFirstExpandedArgument04

	"(ShellSyntaxTestCase selector: #testFirstExpandedArgument04) run"

	|  arg |
	self unix ifTrue:
		[arg := shellSyntax firstExpandedArgument: '/usr/bin/vi' inDirectoryPath: '/usr/bin'.
		self shouldnt: [arg isEmpty].
		self should: [arg = '/usr/bin/vi']]
