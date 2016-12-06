testing - up one directory level
testUpOneDirectoryLevel11

	"(ShellSyntaxTestCase selector: #testUpOneDirectoryLevel11) run"

	|  upOne |
	self win32 ifTrue:
		[upOne := shellSyntax upOneDirectoryLevel: 'C:\Windows'.
		self should: [upOne = 'C:\']]
