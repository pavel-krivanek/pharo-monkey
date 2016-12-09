activation
dispatchSubSliceCommand

	(self argumentAt: 2) = 'list'
		ifTrue: [ ^ self listIssues ].
		
	self fetchIssue.
	(self argumentAt: 2) = 'load'
		ifTrue: [ ^ self loadIssue ].

	(self argumentAt: 2) = 'export'
		ifTrue: [ ^ self exportIssue ].

	self testIssue.
	self exitSuccess.
