testing - path expansion
testExpandedPaths06

	"(ShellSyntaxTestCase selector: #testExpandedPaths06) run"

	| args |
	self unix ifTrue:
		[args := shellSyntax expandedPathsFrom: '/usr/bin/../bin/./../bin/../../usr/bin/vi' beginningAt: nil.
		self should: [args size == 1].
		self should: [args includes: '/usr/bin/vi']]
