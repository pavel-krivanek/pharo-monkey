accessing
state
	
	| firstLine |
	self stateFile exists ifFalse: [ ^ CINonExecutedState new ].
	firstLine := (ZnCharacterReadStream on: (self stateFile readStream binary)) nextLine.
	
	firstLine = 'ERROR' ifTrue: [ 
		^ CIErrorState new
			reasonStep: (self steps detect: [ :step | step state isError ]);
			yourself ].
	
	firstLine = 'SUCCESS' ifTrue: [ 
		^ CISuccessState new ].
	
	self error: 'Unknown state: ', firstLine