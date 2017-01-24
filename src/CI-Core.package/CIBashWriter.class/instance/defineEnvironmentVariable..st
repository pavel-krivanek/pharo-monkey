visiting
defineEnvironmentVariable: anEnvironmentVariable 
	
	self writeLine: '{1}="{2}"' format: { anEnvironmentVariable name . anEnvironmentVariable defaultBashValue }