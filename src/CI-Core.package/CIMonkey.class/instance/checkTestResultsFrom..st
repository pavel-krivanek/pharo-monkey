checking test results
checkTestResultsFrom: aDirectoryReference 

	| validator result |

	validator := CIXMLTestResultValidator on: aDirectoryReference asFileReference.

	result := validator validationResult.
	result change: issue.
	
	^ result.
	
