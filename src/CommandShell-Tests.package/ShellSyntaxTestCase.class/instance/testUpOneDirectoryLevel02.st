testing - up one directory level
testUpOneDirectoryLevel02

	"(ShellSyntaxTestCase selector: #testUpOneDirectoryLevel02) run"

	|  upOne |
	self unix ifTrue:
		[upOne := shellSyntax upOneDirectoryLevel: '/usr'.
		self should: [upOne = '/']]
