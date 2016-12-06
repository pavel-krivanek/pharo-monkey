testing - path expansion
testExpandedPaths24

	"(ShellSyntaxTestCase selector: #testExpandedPaths24) run"

	| args |
	self win32 ifTrue:
		[args := shellSyntax expandedPathsFrom: 'C:\CONFIG.*' beginningAt: '\'.
		self shouldnt: [args isEmpty].
		self should: [args includes: 'C:\CONFIG.SYS']]
