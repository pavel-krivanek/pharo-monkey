testing - path navigation
testAppendPathToPath11

	"(ShellSyntaxTestCase selector: #testAppendPathToPath11) run"

	| path |
	self win32 ifTrue:
		[path := shellSyntax appendPath: 'someFileName' toPath: 'C:\WINDOWS'.
		self should: [path = 'C:\WINDOWS\someFileName']]
