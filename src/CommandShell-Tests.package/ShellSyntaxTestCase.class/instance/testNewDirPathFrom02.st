testing - new dir path
testNewDirPathFrom02

	"(ShellSyntaxTestCase selector: #testNewDirPathFrom02) run"

	| path |
	self unix ifTrue:
		[path := shellSyntax newDirPath: '..' from: '/usr/bin'.
		self should: [path = '/usr']]


	
