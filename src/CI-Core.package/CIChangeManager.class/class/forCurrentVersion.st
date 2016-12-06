instance creation
forCurrentVersion
	^ self perform: ('pharo{1}{2}' format: { 
		SystemVersion current major. 
		SystemVersion current minor. }) asSymbol