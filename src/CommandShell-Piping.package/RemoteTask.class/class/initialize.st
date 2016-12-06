class initialization
initialize
	"Initilialize the serialization strategy. Assume that if Magma is loaded in this image,
	that the Magma serializer is preferred. If Fuel is present, use that. Otherwise use the
	simple and effective default of a Squeak ReferenceStream."

	"RemoteTask initialize"

	"RemoteTask useReferenceStreamSerializer"
	"RemoteTask useFuelSerializer"
	"RemoteTask useMagmaSerializer"

	self headlessChild: true.

	(Smalltalk hasClassNamed: #MaObjectSerializer)
		ifTrue: [^self useMagmaSerializer].

	(Smalltalk hasClassNamed: #FLSerializer)
		ifTrue: [^ self useFuelSerializer].

	self useReferenceStreamSerializer.
