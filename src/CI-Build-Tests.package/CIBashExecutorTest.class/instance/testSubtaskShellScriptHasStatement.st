initialization
testSubtaskShellScriptHasStatement

	| task |
	task := process newTaskNamed: 'test'.
	self setupProcess: [ 
		executor executeSubtask: task.
	] thenAssert: [
		self assert: (executor shellFileForTask: task) statements notEmpty ]
	