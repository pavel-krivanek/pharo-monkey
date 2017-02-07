activation
mainTask
	
	(self hasOption: 'monkey-file') ifTrue: [
		^ CITask fromMonkeyFile: (self optionAt: 'monkey-file')
	].
	
	^ CITask default