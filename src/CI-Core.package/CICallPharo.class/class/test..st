instance creation
test: packagePattern
	
	^ self new
		pharoCommand: 'test';
		arguments: { packagePattern };
		yourself