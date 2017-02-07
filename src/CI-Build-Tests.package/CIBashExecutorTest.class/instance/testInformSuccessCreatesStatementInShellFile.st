initialization
testInformSuccessCreatesStatementInShellFile

	self setupProcess: [ 
		executor informSuccess.
	] thenAssert: [ | shell |
		shell := executor shellFiles anyOne.
		self assert: shell statements notEmpty ]
	