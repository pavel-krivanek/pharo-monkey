instance creation
eval: aString 
	
	^ self new
		pharoCommand: 'eval';
		arguments: { aString };
		yourself