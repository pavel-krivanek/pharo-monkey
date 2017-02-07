executing
executeWith: anExecutor

	files do: [ :each |
		anExecutor dumpFile: each ]