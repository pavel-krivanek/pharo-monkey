testing - up one directory level
testUpOneDirectoryLevel10

	"(ShellSyntaxTestCase selector: #testUpOneDirectoryLevel10) run"

	|  upOne |
	self win32 ifTrue:
		[upOne := shellSyntax upOneDirectoryLevel: 'C:\Windows\temp'.
		self should: [upOne = 'C:\Windows']]
