testing - token expansion
testExpandArgument07
	"File not found, keep the literal token"

	"(ShellSyntaxTestCase selector: #testExpandArgument07) run"

	| args |
	args := shellSyntax expandArgument: 'ho?ts' inDirectoryPath: '/NO/SUCH/DIRECTORY'.
	self shouldnt: [args isEmpty].
	self should: [args includes: 'ho?ts'].
