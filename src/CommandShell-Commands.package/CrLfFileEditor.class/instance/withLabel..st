initialize-release
withLabel: aLabelString
	"Same as #openLabel: but does not open the window in MVC"

	CommandShell isMorphic
		ifTrue:
			[^ self openAsMorphLabel: aLabelString]
		ifFalse:
			[^ self mvcWithLabel: aLabelString]
