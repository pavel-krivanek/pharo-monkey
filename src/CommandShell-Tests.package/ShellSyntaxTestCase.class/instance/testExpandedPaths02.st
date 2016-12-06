testing - path expansion
testExpandedPaths02

	"(ShellSyntaxTestCase selector: #testExpandedPaths02) run"

	| args |
	self unix ifTrue:
		[args := shellSyntax expandedPathsFrom: 'e*c/h*s' beginningAt: '/'.
		self shouldnt: [args isEmpty].
		self should: [args includes: '/etc/hosts']]
