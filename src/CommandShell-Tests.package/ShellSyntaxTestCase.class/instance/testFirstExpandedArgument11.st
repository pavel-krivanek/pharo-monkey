testing - first expanded path
testFirstExpandedArgument11

	"(ShellSyntaxTestCase selector: #testFirstExpandedArgument11) run"

	|  arg |
	self unix ifTrue:
		[arg := shellSyntax firstExpandedArgument: '../bin/v?' inDirectoryPath: '/usr/bin'.
		self shouldnt: [arg isEmpty].
		self should: [arg = '/usr/bin/vi']]
