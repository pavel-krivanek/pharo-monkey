activation
dispatchSubSliceCommand

	(self argumentAt: 2) = 'list'
		ifTrue: [ ^ self listIssues ].
		
	self assert: monkey issue notNil.

	(self argumentAt: 2) = 'fetch'
		ifTrue: [ ^ self fetchAndLockIssue ].

	(self argumentAt: 2) = 'load'
		ifTrue: [ ^ self loadIssue ].

	(self argumentAt: 2) = 'export'
		ifTrue: [ ^ self exportIssue ].

