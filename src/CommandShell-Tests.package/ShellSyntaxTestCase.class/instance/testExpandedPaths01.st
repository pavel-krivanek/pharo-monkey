testing - path expansion
testExpandedPaths01

	"(ShellSyntaxTestCase selector: #testExpandedPaths01) run"

	| args |
	self unix ifTrue:
		[args := shellSyntax expandedPathsFrom: '/e*c/h*s' beginningAt: nil.
		self shouldnt: [args isEmpty].
		self should: [args includes: '/etc/hosts']]
