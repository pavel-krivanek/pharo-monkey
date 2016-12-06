testing - argument tokens
testArgsFromCommand01

	"(ShellSyntaxTestCase selector: #testArgsFromCommand01) run"

	| args |
	args := shellSyntax argsFromCommand: 'sleep 6'.
	self should: [args size == 2].
	self should: [args first = 'sleep'].
	self should: [args last = '6']
