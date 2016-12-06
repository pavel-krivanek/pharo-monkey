testing - token expansion
testExpandArgument14
	"Character ranges. Answer /etc/hosts."

	"(ShellSyntaxTestCase selector: #testExpandArgument14) run"

	| args |
	self unix ifTrue:
		[args := shellSyntax expandArgument: 'ho[s]ts' inDirectoryPath: '/etc'.
		self shouldnt: [args isEmpty].
		self should: [args includes: 'hosts']]
