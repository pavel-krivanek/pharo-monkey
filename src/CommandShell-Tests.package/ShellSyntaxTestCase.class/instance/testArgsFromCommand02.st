testing - argument tokens
testArgsFromCommand02

	"(ShellSyntaxTestCase selector: #testArgsFromCommand02) run"

	| args |
	args := shellSyntax argsFromCommand: 'ls -l h?s*'.
	self should: [args size == 3].
	self should: [args last = 'h?s*']
