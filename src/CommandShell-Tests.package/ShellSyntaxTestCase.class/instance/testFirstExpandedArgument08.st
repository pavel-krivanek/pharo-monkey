testing - first expanded path
testFirstExpandedArgument08

	"(ShellSyntaxTestCase selector: #testFirstExpandedArgument08) run"

	|  arg |
	self unix ifTrue:
		[arg := shellSyntax firstExpandedArgument: '/us[r-r]/b[a-z]n/vi' inDirectoryPath: nil.
		self shouldnt: [arg isEmpty].
		self should: [arg = '/usr/bin/vi']]
