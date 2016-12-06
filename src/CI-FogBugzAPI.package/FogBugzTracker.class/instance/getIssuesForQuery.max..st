private
getIssuesForQuery: query max: maxSize
	| arguments rawIssues |
	
	arguments := Dictionary new
		at: 'cmd' put: 'search';
		at: 'q' put: query;
		at: 'cols' put: self columnsToQuery;
		yourself.
		
	maxSize ifNotNil: [ 
		arguments at: 'max' put: maxSize asString ].
					
	rawIssues := self sendRequestWithArguments: arguments.
	^ FogBugzCase 
		buildIssuesFrom: rawIssues
		tracker: self