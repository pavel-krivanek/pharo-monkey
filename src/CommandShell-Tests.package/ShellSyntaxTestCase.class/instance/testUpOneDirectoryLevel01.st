testing - up one directory level
testUpOneDirectoryLevel01

	"(ShellSyntaxTestCase selector: #testUpOneDirectoryLevel01) run"

	|  upOne |
	self unix ifTrue:
		[upOne := shellSyntax upOneDirectoryLevel: '/usr/bin'.
		self should: [upOne = '/usr']]
