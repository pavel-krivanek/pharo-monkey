action
fetchNextIssue

	self publisher progressMessage: 'Fetching next issue...'.
	issue := self manager nextIssueToBeChecked.
	issue ifNil: [ 
		self publisher progressMessage: 'No more open issues available'. 
		self exitSuccess ].
	^ issue