visiting
visitCallCIStep: aCICallCIStep 
	
	| aCIStep |
	aCIStep := aCICallCIStep step.

	aCIStep import do: [ :each | | importedStep |
		importedStep := aCIStep process stepNamed: each.
		self copyAllIn: importedStep to: aCIStep buildDirectory recursive: true. ].
	
	self
		setWorkingDirectory: aCIStep buildDirectory
		during: [ 
			self bash: '../build.sh'.
			self ensureCreateDirectory: aCIStep outputDirectory.	
			aCIStep output do: [ :each | self copy: each to: aCIStep outputDirectory recursive: true ] ]