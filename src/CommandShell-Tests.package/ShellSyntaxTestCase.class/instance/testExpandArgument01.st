testing - token expansion
testExpandArgument01
	"This will not work on a non-unix system, as it assumes existence of '/etc/hosts'"

	"(ShellSyntaxTestCase selector: #testExpandArgument01) run"

	| args |
	self unix ifTrue:
		[args := shellSyntax expandArgument: 'ho?ts' inDirectoryPath: '/etc'.
		self shouldnt: [args isEmpty].
		self should: [args includes: 'hosts']]
