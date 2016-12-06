printing
printQueryOn: aStream
	| atBeginning |

	self hasQuery
		ifFalse: [^ self].
	
	aStream nextPut: $?.
	atBeginning := true.
	self rawQuery keysAndValuesDo: [:key :value |
		atBeginning
			ifTrue: [atBeginning := false]
			ifFalse: [aStream nextPut: $&].
		aStream
			nextPutAll: key;
			nextPut: $=;
			nextPutAll: value].