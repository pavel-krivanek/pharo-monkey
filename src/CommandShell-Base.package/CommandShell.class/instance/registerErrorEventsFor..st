event registration
registerErrorEventsFor: aPipeline
	"When an event driven PipeJunction has error data available, it will
	trigger #errorDataReady."

	aPipeline when: #errorDataReady
		send: #copyAllErrorFrom:
		to: self
		with: aPipeline
