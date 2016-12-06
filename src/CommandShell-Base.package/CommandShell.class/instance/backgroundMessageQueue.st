accessing
backgroundMessageQueue
	"When a background pipeline completes, it places a message in this queue.
	The message will be displayed the next time the user accepts a line of
	text (presses CR)."

	^ backgroundMessageQueue ifNil: [backgroundMessageQueue := OrderedCollection new]
