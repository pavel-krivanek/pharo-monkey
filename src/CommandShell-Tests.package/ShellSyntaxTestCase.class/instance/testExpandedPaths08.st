testing - path expansion
testExpandedPaths08

	"(ShellSyntaxTestCase selector: #testExpandedPaths08) run"

	| args |
	self unix ifTrue:
		[args := shellSyntax
			expandedPathsFrom: '/usr/bin/../bin/./../bin/../../../../../usr/bin/vi'
			beginningAt: nil.
		self should: [args size == 1].
		self should: [args includes: '/usr/bin/vi']]
