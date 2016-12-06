tools
resumeHangedIssues

	| issues |
	issues := self getIssuesForQuery: 'status:"Resolved (Monkey is checking)" orderBy:"-lastupdated"' max: 5.
	issues do: [ :each | 
		each isHangingOnMonkeyCheck ifTrue: [ 
			each 
				statusFixReviewNeeded;
				saveStatus: 'Check seems to be stuck. I will try it again'
			 ]				
 	]