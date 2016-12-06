streaming
upToEnd
	"Answer all available characters from the output of my external process."

	^ accessProtect critical: [super upToEnd]
