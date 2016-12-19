action-list
listIssues
	
	self monkey issue 
		ifNil: [ self monkey listOpenIssues ]
		ifNotNil: [
			self monkey printOpenIssue: self monkey issue  ]
	
	
