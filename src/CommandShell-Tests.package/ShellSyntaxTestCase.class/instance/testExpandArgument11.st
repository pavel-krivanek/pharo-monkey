testing - token expansion
testExpandArgument11
	"This should work on any system. If no file exists by the given name, then leave
	the name token unmodified."

	"(ShellSyntaxTestCase selector: #testExpandArgument11) run"

	| args |
	args := shellSyntax expandArgument: nil inDirectoryPath: '/etc'.
	self should: [args isEmpty].
