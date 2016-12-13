activation
processJoinReports

	<argument>
	
	^ ((self argumentAt: 1) = 'joinReports')
		ifTrue: [ self joinReports. true ]
		ifFalse: [ false ].
