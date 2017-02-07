subtasks
searchSubtask: aString 
	
	self withAllSubstasksDo: [ :task |
		task name = aString
			ifTrue: [ ^ task ] ]