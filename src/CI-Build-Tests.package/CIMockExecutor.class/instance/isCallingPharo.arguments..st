testing
isCallingPharo: command arguments: arguments 
	
	^ lastPharoCommand = command
		and: [ lastPharoCommandArguments asArray = arguments asArray ]