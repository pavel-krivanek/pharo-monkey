serializing
getResult
	"Materialize the result, reading serialized data from standard input"

	SerializingStrategy = #referenceStream
		ifTrue: [^(Materializer on: childProxy pipeFromOutput reader) next].

	SerializingStrategy = #fuel
		ifTrue: [^(Materializer materializeFrom: childProxy pipeFromOutput reader binary) root].

	SerializingStrategy = #magma
		ifTrue: [^Materializer objectFromStream: childProxy pipeFromOutput reader].

	self error: 'undefined strategy ', SerializingStrategy asString
