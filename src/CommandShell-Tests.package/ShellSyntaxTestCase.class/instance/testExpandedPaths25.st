testing - path expansion
testExpandedPaths25
	"If no expanded path is found, answer an empty collection"

	"(ShellSyntaxTestCase selector: #testExpandedPaths25) run"

	| args |
	args := shellSyntax expandedPathsFrom: 'CONFIG.*' beginningAt: nil.
	self should: [args isEmpty].
