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
	
	monkey issue ifNil: [ 
		self publisher progressMessage: 'No more open issues available'; lf.
		self exitSuccess ].
	