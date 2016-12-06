streaming
next
	"Answer the next character from the output stream of my external process,
	or nil if no data is available."

	| s |
	s := accessProtect critical: [pipeFromOutput ifNotNil: [pipeFromOutput next]].
	^ s