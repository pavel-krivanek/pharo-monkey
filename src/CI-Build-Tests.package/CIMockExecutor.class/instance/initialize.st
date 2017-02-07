initialization
initialize
	super initialize.
	
	dumpedFiles := Set new.
	executedTasks := Set new.
	logs := OrderedCollection new.