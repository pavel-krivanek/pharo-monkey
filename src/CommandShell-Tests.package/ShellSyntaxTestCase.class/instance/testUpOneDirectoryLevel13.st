testing - up one directory level
testUpOneDirectoryLevel13

	"(ShellSyntaxTestCase selector: #testUpOneDirectoryLevel13) run"

	|  upOne |
	self win32 ifTrue:
		[upOne := shellSyntax upOneDirectoryLevel: 'D:\Windows\temp'.
		self should: [upOne = 'D:\Windows']]
