accessing
stepNamed: aString 
	
	^ steps
		detect: [ :step | step name = aString ]
		ifNone: [ CIStepNotFoundError name: aString ]