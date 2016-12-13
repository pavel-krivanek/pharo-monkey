activation
processSlice

	<argument>
	

	^ ((self argumentAt: 1) = 'slice')
		ifTrue: [ 
			self setUpSlice.
			self dispatchSubSliceCommand.
			true ]
		ifFalse: [ false ].
	