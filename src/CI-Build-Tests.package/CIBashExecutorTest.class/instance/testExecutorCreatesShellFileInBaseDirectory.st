initialization
testExecutorCreatesShellFileInBaseDirectory

	self assert: (executor shellFileForTask: process) path parent equals: process baseDirectory