setup
loadIssue

	self inform: 'Loading  issue: ', issue asString.
	issue load.
	
	self inform: 'Saving image...'.
	Smalltalk snapshot: true andQuit: true.