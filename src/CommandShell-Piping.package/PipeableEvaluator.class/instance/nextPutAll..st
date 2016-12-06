streaming
nextPutAll: aCollection
	"Write aCollection to the standard input stream of my process."

	| readPosition |
	readPosition := pipeToInput position.
	pipeToInput setToEnd nextPutAll: aCollection.
	pipeToInput position: readPosition.
	^ pipeToInput
