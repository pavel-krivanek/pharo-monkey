testing
atEnd
	"Answer whether the receiver can access any more objects. A nonblocking
	pipe with writer end closed which answers nil is considered to be at end.
	See InternalPipe>>closeWriter. Yes, it is ugly to have a pipe which cannot
	pass a nil object, but this is intended to mimic the behavior of an external
	OS pipe in nonblocking mode."

	^ self writerClosed and:
		[self isBlocking
			ifTrue:
				[(queue size == 0) or:
					[(queue size == 1) and:
						[(queue nextPut: queue next) isNil]]]
			ifFalse:
				[queue size == 0]]
