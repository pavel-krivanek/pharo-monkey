testing - path expansion
testExpandedPaths27

	"(ShellSyntaxTestCase selector: #testExpandedPaths27) run"

	| args |
	self win32 ifTrue:
		[args := shellSyntax
			expandedPathsFrom: '..\..\..\..\..\..\..\..\..\WINDOWS\*.*'
			beginningAt: 'C:\WINDOWS'.
		self shouldnt: [args isEmpty].
		self should: [args includes: 'C:\WINDOWS\WRITE.EXE']]
