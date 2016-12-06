testing - path navigation
testAppendPathToPath13

	"(ShellSyntaxTestCase selector: #testAppendPathToPath13) run"

	| path |
	self unix ifTrue:
		[path := shellSyntax appendPath: '..' toPath: 'usr/bin'.
		self should: [path = 'usr']]
