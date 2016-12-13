checking test results
joinReports

	| validator result reportFile htmlPublisher reports success|
	
	htmlPublisher := CIHTMLPublisherForSingleStep asCIPublisher.
	reportFile := self optionAt: 'reportFile' ifAbsent: [ nil ].	
	reportFile ifNotNil: [ htmlPublisher fileName: reportFile ].
	
	success := (self optionAt: 'success' ifAbsent: [ nil ]) = #true.

	manager := CIChangeManager pharo.
	manager publisher: (CIComposedPublisher 
		with: CICommandLinePublisher asCIPublisher
		with: htmlPublisher).
	"Fogbugz does not work anonymously"
	self authenticateTracker.
	
	self fetchIssue.	
		
	result := CIValidationResult change: issue.	
	result stepName: 'Overall result'.
	success ifFalse: [result addError: 'Some validation step failed' ].
		
	reports := (self arguments allButFirst reject: [ :each | each beginsWith: '--' ]) collect: [:each | each asFileReference readStream binary ].

	manager publisher publishValidationResult: result reports: reports.
	
	result isSuccess 
		ifTrue: [ Smalltalk exitSuccess ]
		ifFalse: [ Smalltalk exit: 1 ].
		

	