streaming
nextPutAll: characters
	"Write characters to the standard input stream of my external process."

	^ pipeToInput nextPutAll: characters