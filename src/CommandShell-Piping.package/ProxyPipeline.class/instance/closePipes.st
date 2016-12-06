initialize - release
closePipes

	| p |
	self do: [:e | e closePipes].
	self unregisterEvents.
	(p := self pipeFromOutput) ifNotNil: [p close]
