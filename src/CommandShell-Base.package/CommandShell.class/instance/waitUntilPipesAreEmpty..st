event handling
waitUntilPipesAreEmpty: aPipeline
	"Some other Smalltalk process may be updating the pipes, or we may be
	waiting for data in an external OS pipe to be read into the image. Wait
	for these to reach completion."

	[aPipeline pipesAreEmpty] whileFalse: [(Delay forMilliseconds: 100) wait]
