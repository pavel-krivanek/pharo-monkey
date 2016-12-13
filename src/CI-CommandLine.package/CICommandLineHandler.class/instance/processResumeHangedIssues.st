activation
processResumeHangedIssues

	<argument>
	
	^ ((self argumentAt: 1) = 'resumeHangedIssues')
		ifTrue: [ 
			self setUpTracker.
			self resumeHangedIssues. 
			true ]
		ifFalse: [ false ].
	