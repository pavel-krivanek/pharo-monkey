testing - path navigation
testAppendPathToPath01

	"(ShellSyntaxTestCase selector: #testAppendPathToPath01) run"

	| path |
	self unix ifTrue:
		[path := shellSyntax appendPath: 'hosts' toPath: '/etc'.
		self should: [path = '/etc/hosts']]
