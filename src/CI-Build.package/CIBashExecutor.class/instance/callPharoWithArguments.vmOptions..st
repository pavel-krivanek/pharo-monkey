executing
callPharoWithArguments: arguments vmOptions: vmOptions
	
	self runManaged: ('{1} {2} {3} {4}' format: { 
		'${PWD}/pharo'.
		' ' join: vmOptions. 
		'${PWD}/Pharo.image'. 
		' ' join: arguments. }).