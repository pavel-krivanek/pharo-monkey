accessing
configurationVersionOrDefault
	^ self configurationVersion isEmptyOrNil
		ifTrue: [ #stable ]
		ifFalse: [ self configurationVersion ]