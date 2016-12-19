checking test results
joinReports: reportFileNames to: reportFile as: successOrFailure

	| result htmlPublisher reports |
	
	htmlPublisher := CIHTMLPublisherForSingleStep asCIPublisher.
	reportFile ifNotNil: [ htmlPublisher fileName: reportFile ].

	result := CIValidationResult change: issue.	
	result stepName: 'Overall result'.
	successOrFailure ifFalse: [result addError: 'Some validation step failed' ].
	reports := reportFileNames collect: [:each | each asFileReference readStream].
	htmlPublisher publishValidationResult: result reports: reports.
	
	^ result 
	
		

	