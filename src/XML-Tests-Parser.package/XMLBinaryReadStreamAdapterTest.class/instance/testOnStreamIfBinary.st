tests
testOnStreamIfBinary
	| stream adapter |

	stream := '1' readStream.
	self assert: (self streamAdapterClass onStreamIfBinary: stream) == stream.

	stream upToEnd.
	self assert: (self streamAdapterClass onStreamIfBinary: stream) == stream.

	stream := #(1) readStream.
	adapter := self streamAdapterClass onStreamIfBinary: stream.
	self assert: adapter class == self streamAdapterClass.

	stream upToEnd.
	self assert: (self streamAdapterClass onStreamIfBinary: stream) == stream.