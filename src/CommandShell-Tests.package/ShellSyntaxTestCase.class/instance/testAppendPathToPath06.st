testing - path navigation
testAppendPathToPath06

	"(ShellSyntaxTestCase selector: #testAppendPathToPath06) run"

	| path |
	self unix ifTrue:
		[path := shellSyntax appendPath: '../bin/./../bin/vi' toPath: '/usr/bin'.
		self should: [path = '/usr/bin/vi']]
