subtasks
taskNamed: aString 
	
	^ tasks detect: [ :each | each name = aString ]