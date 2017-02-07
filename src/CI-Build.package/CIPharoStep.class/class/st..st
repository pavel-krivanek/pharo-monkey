instance creation
st: aString 
	
	^ CIStScriptStep new
		headless;
		filePath: aString;
		yourself