instance creation
eval: aString 
	
	^ CIEvalScriptStep new
		headless;
		expression: aString;
		yourself