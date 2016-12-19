accessing
updateFileName: aCIValidationResult
	fileName ifNil: [ 
		fileName := aCIValidationResult change 
			ifNotNil: [ :anIssue | anIssue id asString ] 
			ifNil: [ 'unknownIssue' ]]