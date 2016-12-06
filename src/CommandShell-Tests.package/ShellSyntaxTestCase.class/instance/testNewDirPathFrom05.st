testing - new dir path
testNewDirPathFrom05

	"(ShellSyntaxTestCase selector: #testNewDirPathFrom05) run"

	| path |
	self unix ifTrue:
		[path := shellSyntax newDirPath: '../../../../../usr' from: '/usr/bin'.
		self should: [path = '/usr']]


	
