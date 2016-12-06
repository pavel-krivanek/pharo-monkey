testing - token expansion
testExpandArgument08
	"File not found, keep the literal token"

	"(ShellSyntaxTestCase selector: #testExpandArgument08) run"

	| args |
	args := shellSyntax expandArgument: 'ho?ts' inDirectoryPath: nil.
	self shouldnt: [args isEmpty].
	self should: [args includes: 'ho?ts'].
