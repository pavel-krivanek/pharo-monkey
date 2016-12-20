checking test results
joinReports

	| result reports resultMessage success|

	result := CIValidationResult change: self monkey issue.	
	success := (self optionAt: 'success' ifAbsent: [ nil ]) = #true.
	resultMessage := self optionAt: 'resultMessage' ifAbsent: [ 'Some validation step failed' ].
	success ifFalse: [result addError: resultMessage ].
	reports := (self arguments allButFirst reject: [ :each | each beginsWith: '--' ]) select: [ :each | each asFileReference exists ] 
	thenCollect: [:each | each asFileReference readStream ].
	
	result subreports addAll: reports.
	
	^ result	