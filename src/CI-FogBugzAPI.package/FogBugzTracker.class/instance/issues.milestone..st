querying
issues: statusCollection milestone: aString
	| status |
	
	status := String streamContents: [ :stream | 
		statusCollection 
			do: [ :each | stream << 'status:"' << each << '"' ]
			separatedBy: [ stream << ' OR ' ] ].
	
	^ self getIssuesForQuery: '(', status, ' AND milestone:"Pharo', aString, '")'