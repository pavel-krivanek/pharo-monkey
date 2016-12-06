event registration
registerPromptEventFor: aPipeline

	aPipeline when: #complete
		send: #promptWhenComplete:
		to: self
		with: aPipeline
