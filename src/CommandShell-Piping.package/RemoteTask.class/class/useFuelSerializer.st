class initialization
useFuelSerializer
	"RemoteTask useFuelSerializer"

	Serializer := (Smalltalk at: #FLSerializer ifAbsent: [self error: 'Fuel not installed']) newDefault.
	Materializer := (Smalltalk at: #FLMaterializer) newDefault..
	^SerializingStrategy := #fuel