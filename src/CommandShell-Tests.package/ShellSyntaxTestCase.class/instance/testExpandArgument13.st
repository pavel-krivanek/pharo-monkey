testing - token expansion
testExpandArgument13
	"Character ranges. Answer /etc/hosts."

	"(ShellSyntaxTestCase selector: #testExpandArgument13) run"

	| args |
	self unix ifTrue:
		[args := shellSyntax expandArgument: 'ho[tsr]ts' inDirectoryPath: '/etc'.
		self shouldnt: [args isEmpty].
		self should: [args includes: 'hosts']]
