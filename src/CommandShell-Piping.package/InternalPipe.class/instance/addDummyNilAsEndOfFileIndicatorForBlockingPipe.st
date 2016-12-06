finalization
addDummyNilAsEndOfFileIndicatorForBlockingPipe
	"And add a trailing nil to the pipe to mimic the behaviour of an external pipe
	which blocks until the writer end is closed. Writing a trailing nil the the queue
	has the side effect of waking up any process which is blocked waiting on the
	queue, which will receive the nil as an indication that the pipe has been closed.
	FIXME: This is almost certainly a Bad Idea, so it is encapsulated in its own method."

	self isBlocking ifTrue: [queue nextPut: nil]
