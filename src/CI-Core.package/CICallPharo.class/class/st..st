instance creation
st: aString 
	
	^ self new
		pharoCommand: 'st';
		arguments: { aString };
		yourself