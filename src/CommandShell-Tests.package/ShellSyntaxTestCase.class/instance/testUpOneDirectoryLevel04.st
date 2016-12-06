testing - up one directory level
testUpOneDirectoryLevel04

	"(ShellSyntaxTestCase selector: #testUpOneDirectoryLevel04) run"

	|  upOne |
	upOne := shellSyntax upOneDirectoryLevel: ''.
	self should: [upOne = '..']
