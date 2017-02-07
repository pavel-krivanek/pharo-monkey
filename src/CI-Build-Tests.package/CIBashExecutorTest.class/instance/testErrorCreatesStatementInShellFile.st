initialization
testErrorCreatesStatementInShellFile

	self setupProcess: [ 
		executor error: 5.
	] thenAssert: [ | shell |
		shell := executor shellFiles anyOne.
		self assert: shell statements notEmpty ]
	