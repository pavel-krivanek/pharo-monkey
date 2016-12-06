command history
historyAt: anInteger

	| bufferSize index |
	bufferSize := commandHistory size / 2.
	(anInteger > 0)
		ifTrue:
			[index := bufferSize + 1 - historyIndex + anInteger * 2]
		ifFalse:
			[index := bufferSize + anInteger * 2].
	((index > commandHistory size) | (index < 1))
		ifTrue: [^ '']
		ifFalse: [^ commandHistory at: index]
