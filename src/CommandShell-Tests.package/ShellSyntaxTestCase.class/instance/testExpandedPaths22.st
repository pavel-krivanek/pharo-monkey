testing - path expansion
testExpandedPaths22

	"(ShellSyntaxTestCase selector: #testExpandedPaths22) run"

	| args |
	self win32 ifTrue:
		[args := shellSyntax expandedPathsFrom: 'C:\*.*' beginningAt: nil.
		self shouldnt: [args isEmpty].
		self should: [args includes: 'C:\AUTOEXEC.BAT']]
