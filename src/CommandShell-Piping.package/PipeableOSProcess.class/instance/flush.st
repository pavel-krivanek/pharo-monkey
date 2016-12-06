streaming
flush
	"Flush output to the standard input stream of my external process."

	| p |
	(p := pipeToInput) ifNotNil: [p flush]