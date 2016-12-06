testing - path expansion
testExpandedPaths20

	"(ShellSyntaxTestCase selector: #testExpandedPaths20) run"

	| args |
	self win32 ifTrue:
		[args := shellSyntax expandedPathsFrom: 'C:\WINDOWS\*.*' beginningAt: nil.
		self shouldnt: [args isEmpty].
		self should: [args includes: 'C:\WINDOWS\WRITE.EXE']]
