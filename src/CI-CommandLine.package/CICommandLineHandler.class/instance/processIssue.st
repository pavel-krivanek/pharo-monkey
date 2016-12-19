activation
processIssue

	<argument>
	

	^ ((self argumentAt: 1) = 'issue')
		ifTrue: [ 
			self dispatchSubIssueCommand. ]
		ifFalse: [ nil ].
	