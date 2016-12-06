testing - token expansion
testExpandArgument10
	"This should work on any system. If no file exists by the given name, then leave
	the name token unmodified."

	"(ShellSyntaxTestCase selector: #testExpandArgument10) run"

	| args |
	args := shellSyntax expandArgument: 'no*such*file???' inDirectoryPath: '/etc'.
	self shouldnt: [args isEmpty].
	self should: [args includes: 'no*such*file???'].
