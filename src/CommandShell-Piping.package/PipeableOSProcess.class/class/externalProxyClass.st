process proxy classes
externalProxyClass

	"self externalProxyClass"

	^ Smalltalk at: #ExternalOSProcess ifPresent: [:eosp | eosp concreteClass]
