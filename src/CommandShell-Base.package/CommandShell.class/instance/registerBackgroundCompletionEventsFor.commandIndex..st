event registration
registerBackgroundCompletionEventsFor: aPipeline commandIndex: index
	"When an event driven pipeline is complete, it will trigger #complete."

	aPipeline when: #complete
		send: #backgroundPipelineComplete:commandIndex:
		to: self
		withArguments: {aPipeline . index}

