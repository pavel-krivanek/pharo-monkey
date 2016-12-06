testing - token expansion
testExpandArgumentFrom01

	"(ShellSyntaxTestCase selector: #testExpandArgumentFrom01) run"

	| args |
	self unix ifTrue:
		[args := shellSyntax
			expandArgumentsFrom: #('-help' '/b?n/s?' 'ho?ts' 'fs*' 'NOSUCHFILE')
			inDirectoryPath: '/etc'.
		self shouldnt: [args isEmpty].
		self should: [args includes: '-help'].
		self should: [args includes: '/bin/sh'].
		self should: [args includes: '/bin/su'].
		self should: [args includes: 'hosts'].
		self should: [args includes: 'NOSUCHFILE'].
		self shouldnt: [args includes: nil].
		self shouldnt: [args includes: '']]
