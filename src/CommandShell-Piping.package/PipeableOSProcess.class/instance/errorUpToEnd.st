streaming
errorUpToEnd
	"Answer all available characters from the error stream of my external process."

	^ accessProtect critical: [super errorUpToEnd]
