initialization
initialize
	super initialize.
	fileStack := Stack new.
	shellFiles := Set new.
	
	taskFilesDictionary := Dictionary new.