streaming
nextPut: aCharacter
	"Write aCharacter to the standard input stream of my external process."

	^ pipeToInput nextPut: aCharacter