activation
processCloseOldIssues

	<argument>

	^ ((self argumentAt: 1) = 'closeOldIssues')
		ifTrue: [ self setUpTracker.
			self closeOldIssues.]
		ifFalse: [ nil ].
	
