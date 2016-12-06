testing - path navigation
testAppendPathToPath14

	"(ShellSyntaxTestCase selector: #testAppendPathToPath14) run"

	| path |
	self unix ifTrue:
		[path := shellSyntax appendPath: '..' toPath: 'usr'.
		self should: [path = '']]
