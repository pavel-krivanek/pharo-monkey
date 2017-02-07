initialization
testCallPharoCreatesStatementInShellFile

	self setupProcess: [ 
		executor callPharoWithArguments: { 'version' }.
	] thenAssert: [ | shell |
		shell := executor shellFiles anyOne.
		self assert: shell statements notEmpty ]
	