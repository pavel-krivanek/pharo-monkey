testing - path expansion
testExpandedPaths04

	"(ShellSyntaxTestCase selector: #testExpandedPaths04) run"

	| args |
	self unix ifTrue:
		[args := shellSyntax expandedPathsFrom: 'bin/vi' beginningAt: '/usr'.
		self should: [args size == 1].
		self should: [args includes: '/usr/bin/vi']]
