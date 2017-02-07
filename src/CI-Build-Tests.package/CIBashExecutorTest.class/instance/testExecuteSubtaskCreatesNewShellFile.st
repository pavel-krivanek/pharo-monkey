initialization
testExecuteSubtaskCreatesNewShellFile

	self setupProcess: [ 
		process newTaskNamed: 'test'.
	] thenAssert: [
		self assert: executor shellFiles size equals: 2 ]
	