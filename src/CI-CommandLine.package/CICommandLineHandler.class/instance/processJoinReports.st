activation
processJoinReports

	<argument>
	
	^ ((self argumentAt: 1) = 'joinReports')
		ifTrue: [ self joinReports ]
		ifFalse: [ nil ].
