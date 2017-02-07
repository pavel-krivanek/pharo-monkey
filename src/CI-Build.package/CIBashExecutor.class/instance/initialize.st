initialization
initialize
	super initialize.
	fileStack := Stack new.
	shellFiles := Set new.
	isTravis := false.
	
	taskFilesDictionary := Dictionary new.