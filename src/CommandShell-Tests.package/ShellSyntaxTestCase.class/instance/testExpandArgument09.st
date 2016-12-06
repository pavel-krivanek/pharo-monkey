testing - token expansion
testExpandArgument09
	"File not found, keep the literal token. Implementation may optimize to check
	explicitly for a flag string, but the result should be the same."

	"(ShellSyntaxTestCase selector: #testExpandArgument09) run"

	| args |
	args := shellSyntax expandArgument: '-flag' inDirectoryPath: '/etc'.
	self should: [args size == 1].
	self should: [args includes: '-flag'].
