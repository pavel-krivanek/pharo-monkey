accessing
nextPutAll: aCollection 
	"Append the elements of aCollection to the sequence of objects accessible 
	by the receiver. Answer aCollection."

	| result |
	result := aCollection do: [:e | queue nextPut: e].
	self notifyDataReady.
	Processor yield.
	^ result
