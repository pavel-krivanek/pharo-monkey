evaluating
addTreeLeaves: treeOfSymbols to: aCollection
	"Flatten a tree of Symbols built by a Scanner."

	treeOfSymbols do: [:e |
		(e isKindOf: Array)
			ifTrue: [self addTreeLeaves: e to: aCollection]
			ifFalse: [aCollection add: e]].
	^ aCollection