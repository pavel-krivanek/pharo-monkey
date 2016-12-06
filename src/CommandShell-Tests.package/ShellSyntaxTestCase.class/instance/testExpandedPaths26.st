testing - path expansion
testExpandedPaths26

	"(ShellSyntaxTestCase selector: #testExpandedPaths26) run"

	| args |
	self win32 ifTrue:
		[args := shellSyntax expandedPathsFrom: '..\..\..\..\..\..\..\..\..\WINDOWS\*.*' beginningAt: nil.
		self shouldnt: [args isEmpty].
		self should: [args includes: 'C:\WINDOWS\WRITE.EXE']]
