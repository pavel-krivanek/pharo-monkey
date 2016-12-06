testing - first expanded path
testFirstExpandedArgument07

	"(ShellSyntaxTestCase selector: #testFirstExpandedArgument07) run"

	|  arg |
	self unix ifTrue:
		[arg := shellSyntax firstExpandedArgument: '/usr/b[a-z]n/vi' inDirectoryPath: nil.
		self shouldnt: [arg isEmpty].
		self should: [arg = '/usr/bin/vi']]
