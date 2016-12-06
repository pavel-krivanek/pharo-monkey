event handling
promptWhenComplete: aPipeline

	self waitUntilPipesAreEmpty: aPipeline.
	self notifyPrompt