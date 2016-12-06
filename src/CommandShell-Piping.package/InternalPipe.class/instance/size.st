accessing
size
	"An InternalPipe may contain a trailing nil if it has been closed. This should
	not be counted as part of the pipe size, so use #contents to determine the size
	after stripping any trailing nil."

	"InternalPipe new nextPutAll: 'hello'; size"

	^ self closed
		ifTrue: [self contents size]
		ifFalse: [self queue size]
