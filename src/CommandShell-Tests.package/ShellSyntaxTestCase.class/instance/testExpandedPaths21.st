testing - path expansion
testExpandedPaths21

	"(ShellSyntaxTestCase selector: #testExpandedPaths21) run"

	| args |
	self win32 ifTrue:
		[args := shellSyntax expandedPathsFrom: '*.*' beginningAt: 'C:\WINDOWS'.
		self shouldnt: [args isEmpty].
		self should: [args includes: 'C:\WINDOWS\WRITE.EXE']]
