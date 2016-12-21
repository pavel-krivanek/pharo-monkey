action
fetchNextIssue

	self inform: 'Fetching next issue...'.
	issue := self manager nextIssueToBeChecked.
	issue ifNil: [ 
		self publisher progressMessage: 'No more open issues available'.
		self exitSuccess ].
	^ issue