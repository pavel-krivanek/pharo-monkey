testing - up one directory level
testUpOneDirectoryLevel03

	"(ShellSyntaxTestCase selector: #testUpOneDirectoryLevel03) run"

	|  upOne |
	self unix ifTrue:
		[upOne := shellSyntax upOneDirectoryLevel: '/'.
		self should: [upOne = '/']]
