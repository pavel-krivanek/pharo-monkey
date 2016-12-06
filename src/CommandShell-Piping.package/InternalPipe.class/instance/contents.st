accessing
contents
	"Answer contents of the pipe, and return the contents to the pipe so it can still be read."

	"InternalPipe new nextPutAll: 'hello'; contents"

	| s |
	s := self next: queue size.
	self nextPutAll: s.
	^ s