defaults
externalPipeClass
	"If external pipes are not supported, use an internal pipe instead"

	"self externalPipeClass"

	^ Smalltalk
		at: #ExternalPipe
		ifAbsent: [Smalltalk
			at: #OSPipe "Older versions of OSProcess"
			ifAbsent: [InternalPipe]]
