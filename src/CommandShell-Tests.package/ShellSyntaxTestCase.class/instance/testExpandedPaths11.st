testing - path expansion
testExpandedPaths11

	"(ShellSyntaxTestCase selector: #testExpandedPaths11) run"

	| args |
	args := shellSyntax expandedPathsFrom: '*.image' beginningAt: nil.
	self shouldnt: [args isEmpty].
	self should: ['*.image' match: args first].
