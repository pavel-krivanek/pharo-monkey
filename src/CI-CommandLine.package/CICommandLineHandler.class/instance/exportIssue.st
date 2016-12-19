export
exportIssue
	
	| directoryPath  |
	
	directoryPath := self
		optionAt: 'directory'
		ifAbsent: [ ^ self error: 'Missing option --directory' ].
	
	self monkey loadAndExportIssueTo: directoryPath asFileReference.