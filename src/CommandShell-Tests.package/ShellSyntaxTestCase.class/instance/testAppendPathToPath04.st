testing - path navigation
testAppendPathToPath04

	"(ShellSyntaxTestCase selector: #testAppendPathToPath04) run"

	| path |
	self unix ifTrue:
		[path := shellSyntax appendPath: '../bin/vi' toPath: '/usr/bin'.
		self should: [path = '/usr/bin/vi']]
