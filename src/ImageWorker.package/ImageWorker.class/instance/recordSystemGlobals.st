private - forked image
recordSystemGlobals
	"Store all the classes from the image for making #newlyAddedGlobals work"
	systemGlobals := Smalltalk globals values asSet.