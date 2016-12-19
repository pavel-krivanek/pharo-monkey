checking test results
joinReports

	| result reports success|

	result := CIValidationResult change: self monkey issue.	
	success := (self optionAt: 'success' ifAbsent: [ nil ]) = #true.
	success ifFalse: [result addError: 'Some validation step failed' ].
	reports := (self arguments allButFirst reject: [ :each | each beginsWith: '--' ]) collect: [:each | each asFileReference readStream ].
	
	result subreports addAll: reports.
	
	^ result	