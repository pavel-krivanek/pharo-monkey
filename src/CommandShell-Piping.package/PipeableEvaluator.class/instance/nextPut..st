streaming
nextPut: aCharacter
	"Write aCharacter to the standard input stream of my process."

	| readPosition |
	readPosition := pipeToInput position.
	pipeToInput setToEnd nextPut: aCharacter.
	pipeToInput position: readPosition.
	^ pipeToInput
