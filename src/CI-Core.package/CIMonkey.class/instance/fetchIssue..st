action
fetchIssue: issueId
		
	"Fetch issue from issue tracker. The issueId can by symbolic 'next' for obtaining
	next issue to be checked. Can return nil if no fitting issue was found."	

	self assert: self manager isAuthenticated.
		
	(issueId isNil or: [issueId = 'next']) 
		ifTrue: [ ^ self fetchNextIssue ].
	
	issue := self manager changeWithId: issueId.
