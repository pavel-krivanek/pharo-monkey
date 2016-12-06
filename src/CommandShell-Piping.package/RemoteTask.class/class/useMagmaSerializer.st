class initialization
useMagmaSerializer
	"RemoteTask useMagmaSerializer"

	Serializer := (Smalltalk at: #MaObjectSerializer ifAbsent: [self error: 'Magma serializer not installed']) new.
	Materializer := Serializer.
	^SerializingStrategy := #magma