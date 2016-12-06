testing - argument tokens
testArgsFromCommand04

	"(ShellSyntaxTestCase selector: #testArgsFromCommand04) run"

	| args |
	args := shellSyntax argsFromCommand: '''quoted token'' is first'.
	self should: [args size == 3].
	self should: [args first = 'quoted token']
