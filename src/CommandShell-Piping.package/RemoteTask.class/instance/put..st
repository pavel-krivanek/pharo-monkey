serializing
put: result
	"Serialize the result and write to standard output"

	SerializingStrategy = #referenceStream
		ifTrue: [ ^ (Serializer on: OSProcess thisOSProcess stdOut) nextPut: result].

	SerializingStrategy = #fuel
		ifTrue: [ ^ Serializer serialize: result on: OSProcess thisOSProcess stdOut binary].

	SerializingStrategy = #magma
		ifTrue: [ ^Serializer object: result toStream: OSProcess thisOSProcess stdOut].

	self error: 'undefined strategy ', SerializingStrategy asString
