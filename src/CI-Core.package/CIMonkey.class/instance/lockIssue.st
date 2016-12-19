action
lockIssue

	self publisher progressMessage: 'Locking  issue: ', issue asString.
	issue lockForValidation.
	self publisher progressMessage: 'Issue locked:', issue id asString. 
	
	
	
