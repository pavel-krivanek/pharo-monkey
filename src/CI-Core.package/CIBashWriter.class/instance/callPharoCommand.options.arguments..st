high-level
callPharoCommand: command options: options arguments: arguments 
	
	self writeCommand: '{1} {2} {3} {4} {5}' format: { 
		'${PWD}/pharo'. 
		'${PWD}/Pharo.image'. 
		command.
		' ' join: options.
		arguments first }