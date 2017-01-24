activation
activate

	(self hasOption: 'step') ifTrue: [ 
		self process cleanStepNamed: (self optionAt: 'step') ].
	self process clean.
	self exitSuccess.