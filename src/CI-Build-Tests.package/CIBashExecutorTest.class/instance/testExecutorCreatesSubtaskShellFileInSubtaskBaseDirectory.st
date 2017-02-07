initialization
testExecutorCreatesSubtaskShellFileInSubtaskBaseDirectory

	| task |
	task := process newTaskNamed: 'test'.
	executor executeSubtask: task.
	self assert: (executor shellFileForTask: task) path parent equals: task baseDirectory