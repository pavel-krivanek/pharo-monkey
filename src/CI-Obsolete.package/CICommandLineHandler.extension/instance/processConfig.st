*CI-Obsolete
processConfig

	<argument>
	
	^ ((self argumentAt: 1) = 'config')
		ifTrue: [ 
			self setUpConfiguration.
			self dispatchSubConfigurationCommand.
			true ]
		ifFalse: [ false ].	
	