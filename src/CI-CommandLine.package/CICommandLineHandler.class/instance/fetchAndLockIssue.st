as yet unclassified
fetchAndLockIssue

	
	(self hasOption: 'lock') ifTrue: [ 
		self monkey lockIssue ].
		
	FileStream stdout nextPutAll: 'issue fetched:'; nextPutAll: monkey issue id asString; cr; flush.
	