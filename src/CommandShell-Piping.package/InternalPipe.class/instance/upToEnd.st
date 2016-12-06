accessing
upToEnd
	"Answer the remaining elements in the pipe"

	| strm c |
	strm := WriteStream on: String new.
	[self atEnd] whileFalse:
		[c := self next.
		c isNil
			ifTrue: [^ strm contents]
			ifFalse: [strm nextPut: c]].
	^ strm contents