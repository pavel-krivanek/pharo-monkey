menus
exit

	self changed: #accept.
	CommandShell isMorphic
		ifTrue:
			[dependents do: [:d | (d respondsTo: #closeBoxHit) ifTrue: [d closeBoxHit]]]
		ifFalse:
			[dependents first controller closeAndUnschedule]