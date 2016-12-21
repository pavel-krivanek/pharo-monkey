action-list
listNextIssue
	
	| nextIssue |
	
	nextIssue := self fetchNextIssue.
	nextIssue ifNotNil: [ self printOpenIssue: nextIssue].
