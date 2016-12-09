checking test results
checkTestResults

	| directoryPath processReturnValue validator result reportFile htmlPublisher|

	htmlPublisher := CIHTMLPublisherForSingleStep asCIPublisher.
	reportFile := self optionAt: 'reportFile' ifAbsent: [ nil ].	
	reportFile ifNotNil: [ htmlPublisher fileName: reportFile ].

	manager := CIChangeManager pharo.
	manager publisher: (CIComposedPublisher 
		with: CICommandLinePublisher asCIPublisher
		with: htmlPublisher).
	"Fogbugz does not work anonymously"
	self authenticateTracker.
	
	self fetchIssue.	

	directoryPath := self
		optionAt: 'directory'
		ifAbsent: [ ^ self error: 'Missing option --directory' ].
		
	"processReturnValue := self
		optionAt: 'processReturnValue'
		ifAbsent: [ ^ self error: 'Missing option --processReturnValue' ]."

	validator := CIXMLTestResultValidator on: directoryPath asFileReference.

	result := validator validationResult.
	result change: issue.
	
	manager publisher publishValidationResult: result.
	
	self exitSuccess.