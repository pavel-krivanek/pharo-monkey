testing - path expansion
testExpandedPaths07

	"(ShellSyntaxTestCase selector: #testExpandedPaths07) run"

	| args |
	self unix ifTrue:
		[args := shellSyntax expandedPathsFrom: '/bin/../bin/./../bin/../../usr/bin/vi' beginningAt: '/usr'.
		self should: [args size == 1].
		self should: [args includes: '/usr/bin/vi']]
