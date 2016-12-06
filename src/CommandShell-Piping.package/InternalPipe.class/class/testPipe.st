examples
testPipe

	"InternalPipe testPipe inspect"

	| pipe result |
	pipe := self new.
	pipe nextPutAll: 'string to send through an InternalPipe'.
	pipe closeWriter.
	result := pipe upToEnd.
	pipe close.
	^ result
