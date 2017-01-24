visiting
visitCallCIStep: aCICallCIStep 
	
	| aCIStep |
	aCIStep := aCICallCIStep step.

	aCIStep import do: [ :each | | importedStep |
		importedStep := aCIStep process stepNamed: each.
		self
			writeLine: 'cp -r {1}/* {2}'
			format: { importedStep outputDirectory fullName. aCIStep buildDirectory fullName } ].
	
	self writeLine: 'PREVIOUS_PWD="`pwd`"'.
	self writeLine: 'STEP_DIRECTORY="{1}"' format: { aCIStep buildDirectory fullName }.
	self writeLine: 'cd "${STEP_DIRECTORY}"'.
	self writeCommand: '. "../build.sh"'.

	self writeLine: 'mkdir -p {1}' format: { aCIStep outputDirectory fullName }.	
	aCIStep output do: [ :each |
		self
			writeLine: 'cp -r {1} {2}'
			format: { (aCIStep buildDirectory / each) fullName. aCIStep outputDirectory fullName } ].

	self writeLine: 'cd "${PREVIOUS_PWD}"'.
	self newLine.