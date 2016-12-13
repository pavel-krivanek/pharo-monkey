publishing
publishResult

	| message buildURL reportURL reportFile success case |

	manager := CIChangeManager pharo.
	manager publisher: self setUpSlicePublisher.
	"Fogbugz does not work anonymously"
	self authenticateTracker.
	
	self fetchIssue.
	case := issue case.
	
	reportFile := self
		optionAt: 'reportFile'
		ifAbsent: [ ^ self error: 'Missing option --reportFile' ].
	success := (self optionAt: 'success' ifAbsent: [ nil ]) = #true.

	buildURL := (Smalltalk os environment at: 'BUILD_URL' ifAbsent: ['']).
	reportURL := buildURL, '/artifact/', reportFile.

	success 
		ifTrue: [ 
			message := 'Issue Validation Succeeded: ', reportURL.
			case statusFixReviewed.
			case tags add: 'Validated in ', SystemVersion current highestUpdate asString.
			case saveStatusAndTags: message withInternetLineEndings.]
		ifFalse: [ 
			message := 'Issue Validation Failed: ', reportURL.
			case statusWorkNeeded.
			case saveStatus: message withInternetLineEndings.].
			
	Smalltalk exitSuccess.
		