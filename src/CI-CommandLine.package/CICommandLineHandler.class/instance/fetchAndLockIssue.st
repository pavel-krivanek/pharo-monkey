setup
fetchAndLockIssue

	self inform: 'Locking  issue: ', issue asString.
	issue lockForValidation.
	
	FileStream stdout nextPutAll: 'issue locked:'; nextPutAll: issue id asString; cr.
	Smalltalk exitSuccess.