testing - path expansion
testExpandedPaths10

	"(ShellSyntaxTestCase selector: #testExpandedPaths10) run"

	| args |
	self unix ifTrue:
		[args := shellSyntax expandedPathsFrom: '/' beginningAt: '/'.
		self should: [args size == 1].
		self should: [args includes: '/']]
