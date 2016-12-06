event handling
foregroundPipelineComplete: aPipeline
	"This message is sent when aPipeline has completed evaluation.
	Ensure that the output and error event handlers have had a chance
	to completely empty the pipes prior to cleaning things up."

	self waitUntilPipesAreEmpty: aPipeline.
	aPipeline closePipes; release.
	self keyboardConnector: nil.
	[self foregroundProxies removeAll: aPipeline]
		on: Error
		do: ["exit command may cause the collection to be eliminated, hence an error"]
