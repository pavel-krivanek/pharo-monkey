testing - token expansion
testExpandArgument04
	"This should work on any system. If no file exists by the given name, then leave
	the name token unmodified."

	"(ShellSyntaxTestCase selector: #testExpandArgument04) run"

	| args |
	args := shellSyntax expandArgument: 'NOSUCHFILE' inDirectoryPath: '/etc'.
	self shouldnt: [args isEmpty].
	self should: [args includes: 'NOSUCHFILE'].
