testing - new dir path
testNewDirPathFrom04

	"(ShellSyntaxTestCase selector: #testNewDirPathFrom04) run"

	| path |
	self unix ifTrue:
		[path := shellSyntax newDirPath: '../../../../..' from: '/usr/bin'.
		self should: [path = '/']]


	
