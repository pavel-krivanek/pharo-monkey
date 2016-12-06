class initialization
useReferenceStreamSerializer
	"RemoteTask useReferenceStreamSerializer"

	Serializer := (Smalltalk at: #ReferenceStream).
	Materializer := Serializer.
	^SerializingStrategy := #referenceStream