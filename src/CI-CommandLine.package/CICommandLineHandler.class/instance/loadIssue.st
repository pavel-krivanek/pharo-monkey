setup
loadIssue

	self monkey loadIssue.
	
	self optionAt: 'save' ifPresent: [ 
		Smalltalk snapshot: true andQuit: false. ].
	
	