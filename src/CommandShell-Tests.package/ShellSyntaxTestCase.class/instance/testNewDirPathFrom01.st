testing - new dir path
testNewDirPathFrom01

	"(ShellSyntaxTestCase selector: #testNewDirPathFrom01) run"

	| path |
	self unix ifTrue:
		[path := shellSyntax newDirPath: 'b?n' from: '/usr'.
		self should: [path = '/usr/bin']]


	
