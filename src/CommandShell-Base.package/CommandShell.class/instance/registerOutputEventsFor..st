event registration
registerOutputEventsFor: aPipeline
	"When an event driven PipeJunction has new data available, it will
	trigger #outputDataReady."

	aPipeline when: #outputDataReady
		send: #copyAllOutputFrom:
		to: self
		with: aPipeline
