printing
printOn: aStream
	aStream nextPutAll: 'CASE '; print: self id; space.
	self isLoadable
		ifTrue: [ 
			aStream 
				<< 'configuration of ' 
				<< self case configurationName 
				<< ' (' <<  self case configurationVersionOrDefault << ')' ]
		ifFalse: [ aStream nextPutAll: 'without configuration' ]