accessing
nextPut: anObject 
	"Insert the argument, anObject, as the next object accessible by the 
	receiver. Answer anObject."

	| result |
	result := queue nextPut: anObject.
	self notifyDataReady.
	Processor yield.
	^ result
