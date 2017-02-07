initialization
testDumpCreatesStatementInShellFile

	self setupProcess: [
		executor dumpFile: 'dumped'.
	] thenAssert: [ | shell |
		shell := executor shellFiles anyOne.
		self assert: shell statements notEmpty.
	]