visiting
visitNodeWithElements: aNode
	aNode hasChildren
		ifTrue: [aNode nodesDo: [:each | each acceptNodeVisitor: self]]