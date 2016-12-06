testing - path navigation
testAppendPathToPath12

	"(ShellSyntaxTestCase selector: #testAppendPathToPath12) run"

	| path |
	self unix ifTrue:
		[path := shellSyntax appendPath: '..' toPath: '/usr'.
		self should: [path = '/']]
