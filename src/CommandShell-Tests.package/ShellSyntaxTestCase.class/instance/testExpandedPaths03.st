testing - path expansion
testExpandedPaths03

	"(ShellSyntaxTestCase selector: #testExpandedPaths03) run"

	| args |
	self unix ifTrue:
		[args := shellSyntax expandedPathsFrom: '/usr/bin/vi' beginningAt: nil.
		self should: [args size == 1].
		self should: [args includes: '/usr/bin/vi']]
