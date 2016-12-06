streaming
next: count
	"Answer up to count characters from the output stream of my external process,
	or an empty string if no data is available."

	| s |
	s := accessProtect critical: [pipeFromOutput ifNotNil: [pipeFromOutput next: count]].
	^ s