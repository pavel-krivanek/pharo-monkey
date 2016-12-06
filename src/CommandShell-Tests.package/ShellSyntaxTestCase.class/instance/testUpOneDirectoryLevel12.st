testing - up one directory level
testUpOneDirectoryLevel12

	"(ShellSyntaxTestCase selector: #testUpOneDirectoryLevel12) run"

	|  upOne |
	self win32 ifTrue:
		[upOne := shellSyntax upOneDirectoryLevel: 'C:\'.
		self should: [upOne = 'C:\']]
