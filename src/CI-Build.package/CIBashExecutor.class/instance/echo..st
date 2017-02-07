executing
echo: aString 
	
	self executeBash: ('echo "{1}"' format: {aString})