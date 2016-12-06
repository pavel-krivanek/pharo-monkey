testing - token expansion
testExpandArgument06
	"A fully specified path overrides the default directory path."

	"(ShellSyntaxTestCase selector: #testExpandArgument06) run"

	| args |
	self unix ifTrue:
		[args := shellSyntax expandArgument: '/us*/b?n/v?' inDirectoryPath: '/NO/SUCH/PATH'.
		self shouldnt: [args isEmpty].
		self should: [args includes: '/usr/bin/vi']]
