activation
activate

	(self hasOption: 'task')
		ifTrue: [ (self mainTask subtaskNamed: (self optionAt: 'task')) clean ]
		ifFalse: [ self mainTask clean ].
	self exitSuccess.