exporting
exportProcess: aCIProcess 
	
	"We export each one of the steps into a separate build file"
	aCIProcess steps do: [ :step |
		self newWriter visitStep: step ].
	
	"Then we export the main build process into a build file that will call each of the steps"
	self newWriter visitStep: aCIProcess.