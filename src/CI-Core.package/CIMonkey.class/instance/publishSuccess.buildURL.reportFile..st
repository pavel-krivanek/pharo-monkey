action
publishSuccess: aBoolean buildURL: buildURL reportFile: reportFile

	| reportURL message case |
	
	reportURL := buildURL, 'artifact/', reportFile.
	case := self issue case.
	
	aBoolean logCr.

	aBoolean 
		ifTrue: [ 
			message := 'Issue Validation Succeeded: ', reportURL.
			case statusFixReviewed.
			case tags add: 'Validated in ', SystemVersion current highestUpdate asString.
			case saveStatusAndTags: message withInternetLineEndings.]
		ifFalse: [ 
			message := 'Issue Validation Failed: ', reportURL.
			case statusWorkNeeded.
			case saveStatus: message withInternetLineEndings.].
			