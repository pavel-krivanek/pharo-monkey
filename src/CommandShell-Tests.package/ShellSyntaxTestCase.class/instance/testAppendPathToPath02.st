testing - path navigation
testAppendPathToPath02

	"(ShellSyntaxTestCase selector: #testAppendPathToPath02) run"

	| path |
	self unix ifTrue:
		[path := shellSyntax appendPath: 'etc' toPath: '/'.
		self should: [path = '/etc']]
