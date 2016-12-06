accessing
commandHistory
	"Automatically trim the history list, and answer the resulting list."

	| trimIncrement |
	trimIncrement := 1.	"Could be a larger number to copy the collection less often"
	commandHistory isNil
		ifTrue:
			[commandHistory := OrderedCollection new]
		ifFalse:
			[(commandHistory size > (self historyDepth * 2 + (trimIncrement * 2) - 2))
				ifTrue:
					[commandHistory := commandHistory
						copyFrom: (trimIncrement * 2 + 1) to: commandHistory size]].
	^ commandHistory