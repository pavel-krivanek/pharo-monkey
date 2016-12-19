accessing
user: userName password: passwordString issue: issueId

	self user: userName.
	self password: passwordString. 
	self authenticateTracker.
	
	self fetchIssue: issueId.

