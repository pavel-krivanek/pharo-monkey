private
columnsToQuery
	"A list of columns to query to be used in the #getIssuesFor:... methods"
	^String streamContents: [ :stream | 
		self class columnsToQuery 
			asStringOn: stream 
			delimiter: ',' ]