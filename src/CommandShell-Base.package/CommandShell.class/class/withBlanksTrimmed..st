version dependent
withBlanksTrimmed: aString

	^ (aString respondsTo: #withBlanksTrimmed)
		ifFalse: [aString perform: #trimBoth "Pharo"]
		ifTrue: [aString perform: #withBlanksTrimmed]
