private
issueIdFromPullRequestId: aString

	^ [ 
		| xmlString title number |
		self  publisher progressMessage: 'Pull request ID: ', aString.
		xmlString := (ZnEasy get: 'https://api.github.com/repos/pharo-project/pharo/pulls/', aString) contents.
		title := (STONJSON fromString: xmlString) at: #title.
		self  publisher progressMessage: 'Pull request title: ', title.
		number := title asNumber.
		self  publisher progressMessage: 'Issue ID: ', number asString.
		number	
	] ifError: [ :error |
		self  publisher progressMessage: 'Failed to get issue number. ', error asString.
		nil ]