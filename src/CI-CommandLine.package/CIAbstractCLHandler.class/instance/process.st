activation
process
	
	(self hasOption: 'monkey-file') ifTrue: [
		^ CIProcess fromFileNamed: (self optionAt: 'monkey-file')
	].
	
	^ CIProcess default