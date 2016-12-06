event handling
backgroundPipelineComplete: aPipeline commandIndex: index
	"This message is sent when aPipeline has completed evaluation.
	Ensure that the output and error event handlers have had a chance
	to completely empty the pipes prior to cleaning things up."

	self waitUntilPipesAreEmpty: aPipeline.
	aPipeline closePipes; release.
	self backgroundMessageQueue addLast:
		((WriteStream on: String new)
			nextPutAll: '[', index asString, ']+ Done                     ';
			nextPutAll: aPipeline commandLine;
			cr;
			contents).
	self backgroundProxies removeAll: aPipeline.
	self unRegisterBackgroundPipeline: aPipeline at: index.
	self notifyRestorePrompt
