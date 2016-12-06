testing - first expanded path
testFirstExpandedArgument03

	"(ShellSyntaxTestCase selector: #testFirstExpandedArgument03) run"

	|  arg |
	arg := shellSyntax firstExpandedArgument: 'no*such*file???' inDirectoryPath: '/usr/bin'.
	self shouldnt: [arg isEmpty].
	self should: [arg = '/usr/bin/no*such*file???']
