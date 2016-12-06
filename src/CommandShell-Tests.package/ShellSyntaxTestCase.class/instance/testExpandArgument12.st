testing - token expansion
testExpandArgument12
	"Character ranges. Look for /etc/horts or /etc/hosts or /etc/hotts, and answer /etc/hosts."

	"(ShellSyntaxTestCase selector: #testExpandArgument12) run"

	| args |
	self unix ifTrue:
		[args := shellSyntax expandArgument: 'ho[r-t]ts' inDirectoryPath: '/etc'.
		self shouldnt: [args isEmpty].
		self should: [args includes: 'hosts']]
