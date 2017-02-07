initialization
setupProcess: setupBlock thenAssert: assertBlock

	setupBlock value.
	process executeWith: executor.
	executor stop.
	assertBlock value.