setup
fetchAndLockIssue

	self inform: 'Locking  issue: ', issue asString.
	issue lockForValidation.
	
	self inform: 'issue locked:', issue id asString.
	Smalltalk exitSuccess.