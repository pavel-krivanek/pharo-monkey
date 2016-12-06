testing - path navigation
testAppendPathToPath03

	"(ShellSyntaxTestCase selector: #testAppendPathToPath03) run"

	| path |
	self unix ifTrue:
		[path := shellSyntax appendPath: 'vi' toPath: '/usr/bin'.
		self should: [path = '/usr/bin/vi']]
