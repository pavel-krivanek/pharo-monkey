testing - path navigation
testAppendPathToPath10

	"(ShellSyntaxTestCase selector: #testAppendPathToPath10) run"

	| path |
	self win32 ifTrue:
		[path := shellSyntax appendPath: 'WINDOWS' toPath: 'C:\'.
		self should: [path = 'C:\WINDOWS']]
