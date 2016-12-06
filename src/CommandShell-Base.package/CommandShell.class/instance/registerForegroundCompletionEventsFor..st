event registration
registerForegroundCompletionEventsFor: aPipeline
	"When an event driven pipeline is complete, it will trigger #complete."

	aPipeline when: #complete
		send: #foregroundPipelineComplete:
		to: self
		with: aPipeline
