testing - path expansion
testExpandedPaths05

	"(ShellSyntaxTestCase selector: #testExpandedPaths05) run"

	| args |
	self unix ifTrue:
		[args := shellSyntax expandedPathsFrom: '/usr/*/vi' beginningAt: nil.
		self should: [args size == 1].
		self should: [args includes: '/usr/bin/vi']]
