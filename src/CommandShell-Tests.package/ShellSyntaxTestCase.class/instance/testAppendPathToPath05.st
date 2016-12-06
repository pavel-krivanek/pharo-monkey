testing - path navigation
testAppendPathToPath05

	"(ShellSyntaxTestCase selector: #testAppendPathToPath05) run"

	| path |
	self unix ifTrue:
		[path := shellSyntax appendPath: './vi' toPath: '/usr/bin'.
		self should: [path = '/usr/bin/vi']]
