testing - token expansion
testExpandArgument02

	"(ShellSyntaxTestCase selector: #testExpandArgument02) run"

	| args |
	self unix ifTrue:
		[args := shellSyntax expandArgument: '/b?n/s?' inDirectoryPath: '/etc'.
		self shouldnt: [args isEmpty].
		self should: [args includes: '/bin/sh']]
