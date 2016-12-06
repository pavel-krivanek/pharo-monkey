command pipelines
outputOn: aStream
	"Wait for process completion, writing all available output on aStream"

	| d |
	d := nil.
	[self isComplete] whileFalse:
		[(d ifNil: [d := Delay forMilliseconds: 50]) wait.
		aStream nextPutAll: self upToEnd].
	aStream nextPutAll: self upToEndOfFile.
	^ aStream
