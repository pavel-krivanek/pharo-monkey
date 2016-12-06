testing - path expansion
testExpandedPaths23

	"(ShellSyntaxTestCase selector: #testExpandedPaths23) run"

	| args |
	self win32 ifTrue:
		[args := shellSyntax expandedPathsFrom: 'C:\CONFIG.*' beginningAt: nil.
		self shouldnt: [args isEmpty].
		self should: [args includes: 'C:\CONFIG.SYS']]
