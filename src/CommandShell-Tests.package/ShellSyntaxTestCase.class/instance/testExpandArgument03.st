testing - token expansion
testExpandArgument03

	"(ShellSyntaxTestCase selector: #testExpandArgument03) run"

	| args |
	self unix ifTrue:
		[args := shellSyntax expandArgument: 'fs*' inDirectoryPath: '/etc'.
		self shouldnt: [args isEmpty].
		self should: [args includes: 'fstab']]
