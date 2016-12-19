activation
setUpMonkey

	| issueId |

	issueId := self optionAt: 'issue' ifAbsent: [ 'next' ].

	monkey 
		user: self user
		password: self password.
		
	monkey authenticateTracker.
		
	issueId ifNotNil: [ 
		monkey fetchIssue: issueId ].