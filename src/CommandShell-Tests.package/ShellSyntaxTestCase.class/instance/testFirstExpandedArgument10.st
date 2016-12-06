testing - first expanded path
testFirstExpandedArgument10

	"(ShellSyntaxTestCase selector: #testFirstExpandedArgument10) run"

	|  arg |
	self unix ifTrue:
		[arg := shellSyntax firstExpandedArgument: '/t[l-n]p' inDirectoryPath: nil.
		self should: [arg = '/tmp']]
