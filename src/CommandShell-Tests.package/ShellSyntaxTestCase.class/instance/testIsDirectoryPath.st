testing - path navigation
testIsDirectoryPath

	"(ShellSyntaxTestCase selector: #testIsDirectoryPath) debug"

	self unix ifTrue: [
		self should: [ShellSyntax new isDirectoryPath: '/usr/bin'].
		self should: [ShellSyntax new isDirectoryPath: '/'].
		self shouldnt: [ShellSyntax new isDirectoryPath: '/bin/sh'].
		self shouldnt: [ShellSyntax new isDirectoryPath: '/foo'].
		self shouldnt: [ShellSyntax new isDirectoryPath: '/foo/bar'] ].
	self win32 ifTrue: [
		self should: [ShellSyntax new isDirectoryPath: 'C:' ] ]

		
