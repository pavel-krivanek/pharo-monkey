testing - token expansion
testExpandArgument05
	"This should work on any system. If no file exists by the given name, then leave
	the name token unmodified. Even the wild card characters should remain as part
	of the literal text."

	"(ShellSyntaxTestCase selector: #testExpandArgument05) run"

	| args |
	args := shellSyntax expandArgument: 'NO?SUCH*FILE' inDirectoryPath: '/etc'.
	self shouldnt: [args isEmpty].
	self should: [args includes: 'NO?SUCH*FILE'].
