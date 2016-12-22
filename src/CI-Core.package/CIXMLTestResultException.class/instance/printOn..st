accessing
printOn: aStream

	aStream nextPutAll: self type; space.
	
	aStream 
		nextPutAll: testcase asString; 
		nextPutAll: '>>#';
		nextPutAll: selector asString; 
		cr.
		
	"stack do: [ :stackLine |
		stackLine printOn: aStream.
		aStream nextPutAll: '<br/>'.
		 ]."