subtasks
subtaskNamed: aString 
	
	^ self subtasks detect: [ :each | each name = aString ]