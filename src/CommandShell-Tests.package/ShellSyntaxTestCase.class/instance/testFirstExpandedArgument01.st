testing - first expanded path
testFirstExpandedArgument01

	"(ShellSyntaxTestCase selector: #testFirstExpandedArgument01) run"

	|  arg |
	self unix ifTrue:
		[arg := shellSyntax firstExpandedArgument: 'm?*l' inDirectoryPath: '/usr/bin'.
		self shouldnt: [arg isEmpty].
		self should: ['/usr/bin/m*l' match: arg].
		self shouldnt: [arg = '/usr/bin/m?*l']]
