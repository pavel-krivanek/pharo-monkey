initialization
testBashCommandCreatesStatementInShellFile

	self setupProcess: [ 
		executor executeBash: 'ls'.
	] thenAssert: [ | shell |
		shell := executor shellFiles anyOne.
		self assert: shell statements notEmpty ]
	