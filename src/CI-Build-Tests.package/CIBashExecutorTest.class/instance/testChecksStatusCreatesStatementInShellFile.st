initialization
testChecksStatusCreatesStatementInShellFile

	self setupProcess: [ 
		executor checkPreviousStatus.
	] thenAssert: [ | shell |
		shell := executor shellFiles anyOne.
		self assert: shell statements notEmpty ]
	