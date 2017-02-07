instance creation
test: packagePattern
	
	^ self new
		arguments: { 'test' . packagePattern };
		yourself