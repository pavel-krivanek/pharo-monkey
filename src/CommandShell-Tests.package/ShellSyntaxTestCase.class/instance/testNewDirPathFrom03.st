testing - new dir path
testNewDirPathFrom03

	"(ShellSyntaxTestCase selector: #testNewDirPathFrom03) run"

	| path |
	self unix ifTrue:
		[path := shellSyntax newDirPath: '.././bin' from: '/usr/bin'.
		self should: [path = '/usr/bin']]


	
