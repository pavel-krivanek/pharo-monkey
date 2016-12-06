accessing
next: anInteger 
	"Answer the next anInteger elements of my collection."

	| strm c |
	strm := WriteStream on: String new.
	(1 to: anInteger) do: [:index |
		self atEnd
			ifTrue: [^ strm contents]
			ifFalse: [(c := self basicNext) ifNil: [^ strm contents].
					strm nextPut: c]].
	^ strm contents
