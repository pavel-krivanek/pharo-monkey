setup
lockIssue

	
	(self hasOption: 'lock') ifTrue: [ 
		self monkey lockIssue ].
		
	FileStream stdout nextPutAll: 'issue fetched:'; nextPutAll: issue id asString; cr; flush.
	