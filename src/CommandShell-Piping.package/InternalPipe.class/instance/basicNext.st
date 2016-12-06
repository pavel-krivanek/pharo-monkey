accessing
basicNext
	"Answer the next object accessible by the receiver."

	self nonBlockingMode
		ifFalse:
			[^ queue next]
		ifTrue:
			[queue isEmpty ifTrue: [^ nil] ifFalse: [^ queue next]]
