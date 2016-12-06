initialize-release
openLabel: aLabelString

	CommandShell isMorphic
		ifTrue:
			[^ (self openAsMorphLabel: aLabelString) openInWorld]
		ifFalse:
			[^ (self mvcWithLabel: aLabelString) open]
