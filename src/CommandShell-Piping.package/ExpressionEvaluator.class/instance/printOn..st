printing
printOn: aStream

	super printOn: aStream.
	self expression isNil
		ifTrue:
			[self evaluationBlock isNil
				ifTrue:
					[aStream nextPutAll: ' for '.
					self evaluationBlock printOn: aStream]
				ifFalse:
					[aStream nextPutAll: ' for a '.
					self evaluationBlock class printOn: aStream]]
		ifFalse:
			[aStream nextPutAll: ' for '.
			self expression printOn: aStream]
