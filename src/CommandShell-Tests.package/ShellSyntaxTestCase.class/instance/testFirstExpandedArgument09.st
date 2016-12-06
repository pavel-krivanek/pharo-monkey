testing - first expanded path
testFirstExpandedArgument09

	"(ShellSyntaxTestCase selector: #testFirstExpandedArgument09) run"

	|  arg |
	self unix ifTrue:
		[arg := shellSyntax firstExpandedArgument: '/us[z-a]/bin/vi' inDirectoryPath: nil.
		self shouldnt: [arg isEmpty].
		self should: [arg = '/us[z-a]/bin/vi']]
