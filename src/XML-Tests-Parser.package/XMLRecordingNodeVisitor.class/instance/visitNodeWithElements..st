visiting
visitNodeWithElements: aNode
	self messageRecorder
		recordMessageReceiver: self
		selector: #visitNodeWithElements:
		argument: aNode.

	super visitNodeWithElements: aNode.