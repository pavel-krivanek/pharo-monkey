activation
processCheckTestResults

	<argument>
	
	^ ((self argumentAt: 1) = 'checkTestResults')
		ifTrue: [ self checkTestResults. ]
		ifFalse: [ nil ].
		
	