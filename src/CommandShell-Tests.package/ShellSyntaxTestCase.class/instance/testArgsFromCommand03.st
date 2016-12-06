testing - argument tokens
testArgsFromCommand03

	"(ShellSyntaxTestCase selector: #testArgsFromCommand03) run"

	| args |
	args := shellSyntax argsFromCommand: 'This string contains a ''quoted token'' in the middle'.
	self should: [args size == 8].
	self should: [(args at: 5) = 'quoted token']
