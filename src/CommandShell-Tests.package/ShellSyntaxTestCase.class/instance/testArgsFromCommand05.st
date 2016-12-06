testing - argument tokens
testArgsFromCommand05

	"(ShellSyntaxTestCase selector: #testArgsFromCommand05) run"

	| args |
	args := shellSyntax argsFromCommand: 'the last token is ''a quoted token'''.
	self should: [args size == 5].
	self should: [args last = 'a quoted token']
