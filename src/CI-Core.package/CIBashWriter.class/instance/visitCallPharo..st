visiting
visitCallPharo: aCICallPharo 
	
	self writeCommand: '{1} {2} {3} {4} {5}' format: { 
		'${PWD}/pharo'. 
		'${PWD}/Pharo.image'. 
		aCICallPharo pharoCommand.
		' ' join: aCICallPharo options.
		aCICallPharo arguments first }