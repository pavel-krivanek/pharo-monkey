activation
processPublishResult

	<argument>
	
	^ ((self argumentAt: 1) = 'publishResult')
		ifTrue: [ self publishResult. true ]
		ifFalse: [ false ].
